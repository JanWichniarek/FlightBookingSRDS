package scenario

import BackendSession
import Logger
import Passenger
import model.ReservationData

class MakeReservationAndCancelScenario : Scenario {
    override val name: String
        get() = "makeReservationAndCancel"

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        val reservationsList = MakeReservationScenario().execute(session, passenger)
        if (reservationsList.isEmpty()) {
            return emptyList()
        }
        val (flight, reservationId, seat) = reservationsList[0]
        session.cancelReservation(flight.id, seat.seat_no, reservationId)
        val reservationsForMySeat = session.getReservations(flight.id, seat.seat_no)
        if (reservationsForMySeat.any { it.id == reservationId }) {
            Logger.unsuccessfulCancellation(flight, seat)
        } else {
            Logger.addSuccessfulOperation()
        }
        return emptyList()
    }
}
