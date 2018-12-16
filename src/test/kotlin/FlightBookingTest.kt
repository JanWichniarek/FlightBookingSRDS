import model.*
import model.enums.Cities
import model.enums.FlightDates
import org.junit.Test
import java.util.*
import java.util.function.BiFunction

class FlightBookingTest {

    private lateinit var loggingThread: Thread
    private val random = Random()
    private val session = BackendSession("127.0.0.1", "FlightBooking")
    private val allFlights = session.getFlights()

    data class ReservationData(val flight: Flight, val reservationId: ReservationId, val seat: Seat)

    fun makeReservationAndCheck(session: BackendSession, passenger: Passenger): ReservationData? {
        val flight = getRandomFlight()
        val freeSeats = session.getFreeSeats(flight.id)
        var success = false
        if (freeSeats.isNotEmpty()) {
            val seat = freeSeats[random.nextInt(freeSeats.size)]
            val reservationId = session.createNewReservation(passenger, flight.id, seat.seat_no)
            val reservationsForMySeat = session.getReservations(flight.id, seat.seat_no)
            when {
                session.isSeatFree(flight.id, seat.seat_no) -> Logger.addSeatFreeAfterReservation(flight, seat)
                reservationsForMySeat.size == 1 && reservationsForMySeat[0].id == reservationId -> { Logger.addSuccessfulOperation(); success = true }
                reservationsForMySeat.size == 1 && reservationsForMySeat[0].id != reservationId -> Logger.notExistingReservation(flight, seat)
                reservationsForMySeat.size > 1 -> Logger.anotherReservations(flight, seat)
                reservationsForMySeat.isEmpty() -> Logger.addSeatFreeAfterReservation(flight, seat)
            }
            if (success) {
                return ReservationData(flight, reservationId, seat)
            }
        }
        return null
    }

    fun makeReservationAndDecline(session: BackendSession, passenger: Passenger) {
        val (flight, reservationId, seat) = makeReservationAndCheck(session, passenger) ?: return
        session.cancelReservation(flight.id, seat.seat_no, reservationId)
        val reservationsForMySeat = session.getReservations(flight.id, seat.seat_no)
        when {
            !session.isSeatFree(flight.id, seat.seat_no) || reservationsForMySeat.isNotEmpty() ->
                Logger.unsuccessfulCancellation(flight, seat)
            else -> Logger.addSuccessfulOperation()
        }
    }

    fun makeReservationAndChangeReservation(session: BackendSession, passenger: Passenger) {
        val (flight, reservationId, seat) = makeReservationAndCheck(session, passenger) ?: return
        val (changedFlight, changedReservationId, changedSeat) = makeReservationAndCheck(session, passenger) ?: return
        session.cancelReservation(flight.id, seat.seat_no, reservationId)
        val reservationsForMyOldSeat = session.getReservations(flight.id, seat.seat_no)
        val reservationsForMyNewSeat = session.getReservations(changedFlight.id, changedSeat.seat_no)
        when {
            !session.isSeatFree(flight.id, seat.seat_no) || reservationsForMyOldSeat.isNotEmpty() ->
                Logger.unsuccessfulCancellation(flight, seat)
            session.isSeatFree(changedFlight.id, changedSeat.seat_no) || reservationsForMyNewSeat.isEmpty() ->
                Logger.notExistingReservation(changedFlight, changedSeat)
            else -> Logger.addSuccessfulOperation()
        }
    }

    fun makeMultipleFlightsReservation(session: BackendSession, passenger: Passenger) {
        val numberOfFlightsToBook = random.nextInt(2) + 2
        val flightsToBook = mutableSetOf<Flight>()
        val reservations = mutableMapOf<FlightId, Pair<ReservationId, Seat>>()
        while (flightsToBook.size < numberOfFlightsToBook){
            flightsToBook.add(getRandomFlight())
        }
       
        flightsToBook.forEach {
            val freeSeats = session.getFreeSeats(it.id)
            val seat = freeSeats[random.nextInt(freeSeats.size)]
            val reservationId = session.createNewReservation(passenger, it.id, seat.seat_no)
            reservations[it.id] = Pair(reservationId, seat)
        }
        var shouldDeclineAllReservations = false
        flightsToBook.forEach {
            val reservation = reservations[it.id]
            val reservationsForSeat = session.getReservations(it.id, reservation!!.second.seat_no)
            if (reservationsForSeat.size > 1 || (reservationsForSeat.size == 1 && reservationsForSeat[0].id != reservation.first)) {
                shouldDeclineAllReservations = true
            }
        }
        if (shouldDeclineAllReservations) {
            reservations.forEach{
                session.cancelReservation(it.key, it.value.second.seat_no, it.value.first)
            }
            Logger.atomicReservationUnsuccessful()
        } else {
            Logger.addSuccessfulOperation()
        }
    }

    private fun randomScenario(session: BackendSession, passenger: Passenger) {
        val scenarioNumber = random.nextInt(3)
        when (scenarioNumber) {
            0 -> makeReservationAndCheck(session, passenger)
            1 -> makeReservationAndDecline(session, passenger)
            2 -> makeMultipleFlightsReservation(session, passenger)
            3 -> makeReservationAndChangeReservation(session, passenger)
        }
    }

    private fun test(scenario: (BackendSession, Passenger) -> Unit) {
        val threads = mutableListOf<Thread>()
        loggingThread = Thread {
            try {
                while (!Thread.interrupted()) {
                    Thread.sleep(1000)
                    println(Logger.printStatus())
                }
            } catch (e: InterruptedException) {
                // nop
            } finally {
                println(Logger.printStatus())
            }
        }
        loggingThread.start()
        for (i in 0..9) {
            val thread = Thread {
                val passenger = "Pasażer $i"
                for (j in 0..999) {
                    scenario.invoke(session, passenger)
                }
            }
            threads.add(thread)

        }
        threads.forEach { it.start() }
        threads.forEach { it.join() }
        loggingThread.interrupt()
    }

    @Test
    fun testMakeReservationAndCheck() {
        test { session, passenger -> makeReservationAndDecline(session, passenger) }
    }

    private fun getRandomCity() = Cities.getRandomCity()
    private fun getRandomDate() = FlightDates.getRandomDate()
    private fun getRandomPassenger() = arrayOf("abc", "def", "ghi")[random.nextInt(3)]
    private fun getRandomFlight() = allFlights[random.nextInt(allFlights.size)]
}
