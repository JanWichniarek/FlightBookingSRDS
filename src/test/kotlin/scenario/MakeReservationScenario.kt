package scenario

import BackendSession
import FlightBookingTest.Companion.getRandomFlight
import Logger
import Passenger
import model.ReservationData
import java.util.*

class MakeReservationScenario : Scenario {
    private val random = Random()

    override val name: String
        get() = "makeReservationAndCheck"

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
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
                return listOf(ReservationData(flight, reservationId, seat))
            }
        }
        return emptyList()
    }
}
