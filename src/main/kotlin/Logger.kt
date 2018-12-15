import model.Flight
import model.Seat
import java.io.File

object Logger {

    private var operationsExecuted = 0
    private var multipleReservationsOnOneSeat = 0
    private var allLogs = mutableListOf<String>()

    @Synchronized
    fun addSuccessfullOperation() {
        operationsExecuted++
    }

    @Synchronized
    fun addTwoReservationsOnOneSeatError(flight: Flight, seat: Seat) {
        operationsExecuted++
        multipleReservationsOnOneSeat++
        allLogs.add("""Miejsce $seat jest zajęte przez wielu klientów. Lot: $flight""")
    }

    fun saveLogToFile() {
        File("logs.txt").printWriter().use { out ->
            {
                allLogs.forEach { out.println(it) }
                out.println("Liczba wykonanych operacji: $operationsExecuted w tym operacje nieprawidłowe: $multipleReservationsOnOneSeat")
            }
        }
    }


}