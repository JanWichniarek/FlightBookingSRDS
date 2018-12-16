package scenario

import BackendSession
import Passenger
import model.ReservationData
import java.util.*

class RandomScenario : Scenario {
    private lateinit var currentScenario: Scenario
    private val random = Random()
    private val scenarios = listOf(MakeReservationScenario(), MakeReservationAndCancelScenario(), MakeReservationAndChangeScenario(), MakeMultipleFlightsReservationScenario())

    override val name: String
        get() = currentScenario.name

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        currentScenario = scenarios[random.nextInt(scenarios.size)]
        return currentScenario.execute(session, passenger)
    }
}
