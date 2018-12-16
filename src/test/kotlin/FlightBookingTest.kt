import org.junit.Test
import scenario.*
import java.util.*

class FlightBookingTest {

    private lateinit var loggingThread: Thread

    @Test
    fun testRandom() {
        test(RandomScenario())
    }

    @Test
    fun testMakingReservation() {
        test(MakeReservationScenario())
    }

    @Test
    fun testMakingAndCancellingReservation() {
        test(MakeReservationAndCancelScenario())
    }

    @Test
    fun testMakingAndChangingReservation() {
        test(MakeReservationAndChangeScenario())
    }

    @Test
    fun testMakingAtomicMultipleReservations() {
        test(MakeMultipleFlightsReservationScenario())
    }

    private fun test(scenario: Scenario) {
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
                    Logger.start()
                    scenario.execute(session, passenger)
                    Logger.end(scenario.name)
                }
            }
            threads.add(thread)
        }
        threads.forEach { it.start() }
        threads.forEach { it.join() }
        loggingThread.interrupt()
    }

    companion object {
        val session = BackendSession("127.0.0.1", "FlightBooking")
        val allFlights = session.getFlights()
        val random = Random()

        fun getRandomFlight() = allFlights[random.nextInt(allFlights.size)]
    }
}
