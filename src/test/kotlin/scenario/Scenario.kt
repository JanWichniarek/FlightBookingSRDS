package scenario

import BackendSession
import Passenger
import model.ReservationData

interface Scenario {
    val name: String

    fun execute(session: BackendSession, passenger: Passenger): List<ReservationData>
}
