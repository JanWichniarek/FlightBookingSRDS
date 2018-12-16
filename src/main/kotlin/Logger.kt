import model.Flight
import model.Seat
import java.io.File
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicLong

typealias TestName = String
typealias Duration = Long
typealias Denominator = Long
typealias Numerator = Long

object Logger {
    private var operationsExecuted = 0
    private var successfulOperations = 0
    private var multipleReservationsOnOneSeat = 0
    private var seatReservationNotVisible = 0
    private var atomicReservationUnsuccessful = 0
    private var allLogs = mutableListOf<String>()

    private var testsFraction = mutableMapOf<TestName, Pair<Numerator, Denominator>>()
    private var startTime = ThreadLocal<Duration>()
    var connectionExceptions = AtomicLong(0)

    fun start() {
        startTime.set(System.currentTimeMillis())
    }

    @Synchronized
    fun end(testName: TestName) {
        val duration = System.currentTimeMillis() - startTime.get()
        val oldPair = testsFraction[testName] ?: Pair<Numerator, Denominator>(0,0)
        val newPair = Pair(oldPair.first + duration, oldPair.second + 1)
        testsFraction[testName] = newPair
    }

    @Synchronized
    fun printTestsAverageTime(): String {
        val info = StringBuilder()
        testsFraction.forEach { testName, fractionPair ->
            val seconds = TimeUnit.MILLISECONDS.toSeconds(fractionPair.first).toDouble()
            val average = seconds / fractionPair.second;
            val averageRounded = String.format(java.util.Locale.US, "%.3f", average)
            info.append("Scenario $testName avg time: $averageRounded\n")
        }
        return info.toString()
    }

    @Synchronized
    fun addSuccessfulOperation() {
        operationsExecuted++
        successfulOperations++
    }

    @Synchronized
    fun anotherReservations(flight: Flight, seat: Seat) {
        operationsExecuted++
        multipleReservationsOnOneSeat++
        allLogs.add("""Miejsce $seat jest zajęte przez wielu klientów. Lot: $flight""")
    }

    @Synchronized
    fun notExistingReservation(flight: Flight, seat: Seat) {
        operationsExecuted++
        multipleReservationsOnOneSeat++
        allLogs.add("""Nie istnieje rezerwacj na miejsce $seat. Lot: $flight""")
    }

    @Synchronized
    fun unsuccessfulCancellation(flight: Flight, seat: Seat) {
        operationsExecuted++
        multipleReservationsOnOneSeat++
        allLogs.add("""Niepowodzenie $seat odwolania rezerwacji na miejsce $seat. Lot: $flight""")
    }

    @Synchronized
    fun addSeatFreeAfterReservation(flight: Flight, seat: Seat) {
        operationsExecuted++
        seatReservationNotVisible++
        allLogs.add("""Miejsce $seat wolne pomimo rezerwacji w locie $flight""")
    }

    @Synchronized
    fun atomicReservationUnsuccessful() {
        operationsExecuted++
        atomicReservationUnsuccessful++
        allLogs.add("""Nie udało się wykonać atomowej rezerwacji wielu miejsc""")
    }

    fun printStatus(): String {
        return """
            |----------------------------------------
            |operationsExecuted : $operationsExecuted
            |successfulOperations : $successfulOperations
            |multipleReservationsOnOneSeat : $multipleReservationsOnOneSeat
            |seatReservationNotVisible : $seatReservationNotVisible
            |atomicReservationUnsuccessful : $atomicReservationUnsuccessful
            |connectionExceptions : $connectionExceptions
            |${printTestsAverageTime()}
            |----------------------------------------
        """.trimMargin()
    }

    fun saveLogToFile() {
        File("logs.txt").printWriter().use { out -> {
                allLogs.forEach { out.println(it) }
                out.println(printStatus())
            }
        }
    }
}