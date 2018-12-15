import model.Flight
import model.Seat
import java.io.File

object Logger {

    private var operationsExecuted = 0
    private var multipleReservationsOnOneSeat = 0
    private var seatReservationNotVisible = 0
    private var atomicReservationUnsuccessful = 0
    private var allLogs = mutableListOf<String>()

    @Synchronized
    fun addSuccessfulOperation() {
        operationsExecuted++
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
        allLogs.add("""Miejsce $seat wolne pomimo rezerwacji w locie""")
    }

    @Synchronized
    fun atomicReservationUnsuccessful() {
        operationsExecuted++
        atomicReservationUnsuccessful++
        allLogs.add("""Nie udało się wykonać atomowej rezerwacji wielu miejsc""")
    }

    fun printStatus(): String {
        return """
            ----------------------------------------
            operationsExecuted : $operationsExecuted
            multipleReservationsOnOneSeat : $multipleReservationsOnOneSeat
            seatReservationNotVisible : $seatReservationNotVisible
            atomicReservationUnsuccessful : $atomicReservationUnsuccessful
            ----------------------------------------
        """.trimIndent()
    }

    fun saveLogToFile() {
        File("logs.txt").printWriter().use { out -> {
                allLogs.forEach { out.println(it) }
                out.println("Liczba wykonanych operacji: $operationsExecuted w tym operacje nieprawidłowe: $multipleReservationsOnOneSeat")
            }
        }
    }


}