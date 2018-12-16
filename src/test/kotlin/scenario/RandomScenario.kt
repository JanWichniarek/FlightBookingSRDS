package scenario

import BackendSession
import Passenger
import model.ReservationData
import java.util.*

class RandomScenario : Scenario {
    private var currentScenario = ThreadLocal<Scenario>()
    private val random = Random()
    private val scenarios = listOf(MakeReservationScenario(), MakeReservationAndCancelScenario(), MakeReservationAndChangeScenario(), MakeMultipleFlightsReservationScenario())

    override val name: String
        get() = currentScenario.get().name

    override fun execute(session: BackendSession, passenger: Passenger): List<ReservationData> {
        currentScenario.set(scenarios[random.nextInt(scenarios.size)])
        return currentScenario.get().execute(session, passenger)
    }
}
