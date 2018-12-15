package model

import com.datastax.driver.core.Row
import java.util.*

data class Flight(val id: UUID,
                  val departure: String,
                  val destination: String,
                  val date: String,
                  val duration: Int,
                  val cost: Float) {

    constructor(dbRow: Row) : this(dbRow.getUUID("id"),
                                   dbRow.getString("departure"),
                                   dbRow.getString("destination"),
                                   dbRow.getString("date"),
                                   dbRow.getInt("duration"),
                                   dbRow.getFloat("cost"))
}
