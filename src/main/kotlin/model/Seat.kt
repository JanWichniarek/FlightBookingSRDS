package model

import com.datastax.driver.core.Row
import java.util.*

data class Seat(val flight_id: UUID,
                val seat_no: Int,
                val is_free: Boolean) {

    constructor(dbRow: Row) : this(dbRow.getUUID("flight_id"),
                                   dbRow.getInt("seat_no"),
                                   dbRow.getBool("is_free"))
}
