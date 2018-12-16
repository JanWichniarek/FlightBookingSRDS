import model.ReservationData
import org.junit.Test
import scenario.*
import java.util.*
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit

class FlightBookingTest {

    companion object {
        private const val CLEANING_MAX_DELAY = 10
        private val CLEANING_MODE = ReservationCleaning.DELAYED

        private val session = BackendSession("127.0.0.1", "FlightBooking")
        private val allFlights = session.getFlights()
        private val random = Random()

        fun getRandomFlight() = allFlights[random.nextInt(allFlights.size)]
    }

    private enum class ReservationCleaning {
        DISABLED, IMMEDIATE, DELAYED
    }

    private lateinit var loggingThread: Thread
    private val cleaningExecutor = Executors.newSingleThreadScheduledExecutor()

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
                    val reservationsToClean = scenario.execute(session, passenger)
                    Logger.end(scenario.name)
                    when (CLEANING_MODE) {
                        ReservationCleaning.IMMEDIATE -> cancelReservations(reservationsToClean)
                        ReservationCleaning.DELAYED -> cleaningExecutor.schedule({
                            cancelReservations(reservationsToClean)
                        }, random.nextInt(CLEANING_MAX_DELAY + 1).toLong(), TimeUnit.SECONDS)
                    }
                }
            }
            threads.add(thread)
        }
        threads.forEach { it.start() }
        threads.forEach { it.join() }
        loggingThread.interrupt()
        cleaningExecutor.shutdown()
    }

    private fun cancelReservations(reservations: List<ReservationData>) {
        reservations.forEach { session.cancelReservation(it.flight.id, it.seat.seat_no, it.reservationId) }
    }
}
