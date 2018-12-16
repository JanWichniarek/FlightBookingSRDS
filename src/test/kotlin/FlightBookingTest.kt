import model.Flight
import model.Seat
import org.junit.Test
import java.util.*

class FlightBookingTest {

    private lateinit var loggingThread: Thread
    private val random = Random()
    private val session = BackendSession("127.0.0.1", "FlightBooking")
    private val allFlights = session.getFlights()
    private val scenarios = this::class.java.declaredMethods.filter { it.name.startsWith("make") }

    data class ReservationData(val flight: Flight, val reservationId: ReservationId, val seat: Seat)

    @Test
    fun testRandom() {
        test { session, passenger -> randomScenario(session, passenger) }
    }

    @Test
    fun testMakingReservation() {
        Logger.start()
        test { session, passenger -> makeReservationAndCheck(session, passenger) }
        Logger.end("makeReservationAndCheck")
    }

    @Test
    fun testMakingAndCancellingReservation() {
        Logger.start()
        test { session, passenger -> makeReservationAndCancel(session, passenger) }
        Logger.end("makeReservationAndCancel")
    }

    @Test
    fun testMakingAndChangingReservation() {
        Logger.start()
        test { session, passenger -> makeReservationAndChange(session, passenger) }
        Logger.end("makeReservationAndChange")
    }

    @Test
    fun testMakingAtomicMultipleReservations() {
        Logger.start()
        test { session, passenger -> makeMultipleFlightsReservation(session, passenger) }
        Logger.end("makeMultipleFlightsReservation")
    }

    private fun makeReservationAndCheck(session: BackendSession, passenger: Passenger): ReservationData? {
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

    private fun makeReservationAndCancel(session: BackendSession, passenger: Passenger) {
        val (flight, reservationId, seat) = makeReservationAndCheck(session, passenger) ?: return
        session.cancelReservation(flight.id, seat.seat_no, reservationId)
        val reservationsForMySeat = session.getReservations(flight.id, seat.seat_no)
        if (reservationsForMySeat.any { it.id == reservationId }) {
            Logger.unsuccessfulCancellation(flight, seat)
        } else {
            Logger.addSuccessfulOperation()
        }
    }

    private fun makeReservationAndChange(session: BackendSession, passenger: Passenger) {
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

    private fun makeMultipleFlightsReservation(session: BackendSession, passenger: Passenger) {
        val numberOfFlightsToBook = random.nextInt(2) + 2
        val flightsToBook = mutableSetOf<Flight>()
        val reservations = mutableMapOf<FlightId, Pair<ReservationId, Seat>>()
        while (flightsToBook.size < numberOfFlightsToBook) {
            flightsToBook.add(getRandomFlight())
        }
       
        flightsToBook.forEach {
            val freeSeats = session.getFreeSeats(it.id)
            if (freeSeats.isEmpty()) {
                return
            }
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
        val selectedScenario = scenarios[random.nextInt(scenarios.size)]
        Logger.start()
        selectedScenario.invoke(this, session, passenger)
        Logger.end(selectedScenario.name)
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

    private fun getRandomFlight() = allFlights[random.nextInt(allFlights.size)]
}
