package util

import java.util.*

class EnumUtils {
    companion object {
        private val random = Random()

        fun <E : Enum<E>> getRandom(e: Class<E>): E {
            return e.enumConstants[random.nextInt(e.enumConstants.size)]
        }
    }

}
