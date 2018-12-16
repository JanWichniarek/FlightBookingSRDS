package scenario

import BackendSession
import Passenger
import model.ReservationData
import java.util.*

class RandomScenario : Scenario {
    private lateinit var currentScenario: Scenario
    private val lock = Any()
    private val random = Random()
    private val scenarios = listOf(MakeReservationScenario(), MakeReservationAndCancelScenario(), MakeReservationAndChangeScenario(), MakeMultipleFlightsReservationScenario())

    override val name: String
        get() = synchronized(lock) { currentScenario.name }

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        synchronized(lock) {
            currentScenario = scenarios[random.nextInt(scenarios.size)]
        }
        return currentScenario.execute(session, passenger)
    }
}
