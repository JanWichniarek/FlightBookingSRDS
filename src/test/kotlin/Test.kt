import model.Cities
import model.FlightDates
import org.junit.Test
import util.EnumUtils

class Test {

    fun getRandomCity() = EnumUtils.getRandom(Cities::class.java)
    fun getRandomDate() = EnumUtils.getRandom(FlightDates::class.java)

    fun makeReservationAndDeclice() {
        val city = getRandomCity()
        val date = getRandomDate()


    }

    @Test
    private fun test() {
        val threads = mutableListOf<Thread>()
        for (i in 0..9) {
            val thread = Thread {
                val backendSession = BackendSession("127.0.0.1", "FlightBooking")
                for (j in 0..999) {

                    val city = getRandomCity()
                    val date = getRandomDate()
                    val flights = backendSession.getFlights(date.date, city.cityName)
                }
            }
            threads.add(thread)

        }
        threads.forEach { it.start() }
        threads.forEach { it.join() }

    }
}
