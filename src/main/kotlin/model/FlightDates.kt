package model

import java.util.*

enum class FlightDates(val date: String) {
    D2019_05_12("2019-05-12"),
    D2019_06_06("2019-06-06");

    companion object {
        val random = Random()
        fun getRandomDate(): String {
            return FlightDates.values()[random.nextInt(FlightDates.values().size)].date
        }
    }
}