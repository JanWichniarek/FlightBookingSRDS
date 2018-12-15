package model

import com.datastax.driver.core.Row
import java.util.*

data class Reservation(val id: UUID,
                       val flight_id: UUID,
                       val passenger: String,
                       val seat_no: Int) {

    constructor(dbRow: Row) : this(dbRow.getUUID("id"),
                                   dbRow.getUUID("flight_id"),
                                   dbRow.getString("passenger"),
                                   dbRow.getInt("seat_no"))
}
