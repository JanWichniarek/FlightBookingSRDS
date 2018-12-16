package scenario

import BackendSession
import Logger
import Passenger
import model.ReservationData

class MakeReservationAndChangeScenario : Scenario {
    override val name: String
        get() = "makeReservationAndChange"

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        val reservationsList = MakeReservationScenario().execute(session, passenger)
        if (reservationsList.isEmpty()) {
            return emptyList()
        }
        val (flight, reservationId, seat) = reservationsList[0]

        val newReservationsList = MakeReservationScenario().execute(session, passenger)
        if (newReservationsList.isEmpty()) {
            return emptyList()
        }
        val (changedFlight, changedReservationId, changedSeat) = newReservationsList[0]

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
        return newReservationsList
    }
}
