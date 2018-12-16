package scenario

import BackendSession
import FlightBookingTest.Companion.getRandomFlight
import Logger
import Passenger
import model.Flight
import model.ReservationData
import model.Seat
import java.util.*

class MakeMultipleFlightsReservationScenario : Scenario {
    private val random = Random()

    override val name: String
        get() = "makeMultipleFlightsReservation"

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        val numberOfFlightsToBook = random.nextInt(2) + 2
        val seatsToBook = mutableSetOf<Pair<Flight, Seat>>()
        val reservations = mutableListOf<ReservationData>()
        do {
            val flight = getRandomFlight()
            val freeSeats = session.getFreeSeats(flight.id)
            if (freeSeats.isNotEmpty()) {
                seatsToBook += Pair(flight, freeSeats[random.nextInt(freeSeats.size)])
            }
        } while (seatsToBook.size < numberOfFlightsToBook)

        seatsToBook.forEach { (flight,seat) ->
            val reservationId = session.createNewReservation(passenger, flight.id, seat.seat_no)
            reservations += ReservationData(flight, reservationId, seat)
        }
        var shouldDeclineAllReservations = false
        reservations.forEach {
            val reservationsForSeat = session.getReservations(it.flight.id, it.seat.seat_no)
            if (reservationsForSeat.size > 1 || (reservationsForSeat.size == 1 && reservationsForSeat[0].id != it.reservationId)) {
                shouldDeclineAllReservations = true
            }
        }
        if (shouldDeclineAllReservations) {
            reservations.forEach{
                session.cancelReservation(it.flight.id, it.seat.seat_no, it.reservationId)
            }
            Logger.atomicReservationUnsuccessful()
        } else {
            Logger.addSuccessfulOperation()
        }
        return reservations
    }
}
