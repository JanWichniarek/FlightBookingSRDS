package scenario

import BackendSession
import FlightBookingTest.Companion.getRandomFlight
import Logger
import Passenger
import model.Flight
import model.ReservationData
import java.util.*

class MakeMultipleFlightsReservationScenario : Scenario {
    private val random = Random()

    override val name: String
        get() = "makeMultipleFlightsReservation"

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        val numberOfFlightsToBook = random.nextInt(2) + 2
        val flightsToBook = mutableSetOf<Flight>()
        val reservations = mutableListOf<ReservationData>()
        do {
            val flight = getRandomFlight()
            val hasFreeSeats = session.getFreeSeatsCount(flight.id) > 0
            if (hasFreeSeats) {
                flightsToBook += flight
            }
        } while (flightsToBook.size < numberOfFlightsToBook)

        flightsToBook.forEach {
            val freeSeats = session.getFreeSeats(it.id)
            val seat = freeSeats[random.nextInt(freeSeats.size)]
            val reservationId = session.createNewReservation(passenger, it.id, seat.seat_no)
            reservations += ReservationData(it, reservationId, seat)
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
