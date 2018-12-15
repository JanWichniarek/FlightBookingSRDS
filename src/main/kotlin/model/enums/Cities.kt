package model.enums

import java.util.*

enum class Cities(val cityName: String) {
    WARSAW("Warsaw"), TOKYO("Tokyo"), LOS_ANGELES("Los Angeles"), BERLIN("Berlin"), PARIS("Paris");

    companion object {
        val random = Random()
        fun getRandomCity(): String {
            return values()[random.nextInt(values().size)].cityName
        }
    }
}