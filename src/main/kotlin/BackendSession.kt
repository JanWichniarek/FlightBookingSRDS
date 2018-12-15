import com.datastax.driver.core.*
import model.Flight
import model.Reservation
import model.Seat
import org.slf4j.LoggerFactory
import kotlin.RuntimeException

/*
 * For error handling done right see:
 * https://www.datastax.com/dev/blog/cassandra-error-handling-done-right
 *
 * Performing stress tests often results in numerous WriteTimeoutExceptions,
 * ReadTimeoutExceptions (thrown by Cassandra replicas) and
 * OpetationTimedOutExceptions (thrown by the client). Remember to retry
 * failed operations until success (it can be done through the RetryPolicy mechanism:
 * https://stackoverflow.com/questions/30329956/cassandra-datastax-driver-retry-policy )
 */

typealias FlightId = Int
typealias SeatNo = Int

class BackendSession(contactPoint: String, keyspace: String) {

    private val session: Session
    init {
        val cluster = Cluster.builder().addContactPoint(contactPoint).build()
        session = cluster.connect(keyspace)
    }

    private val GET_ALL_RESERVATIONS by lazy { session.prepare("SELECT * FROM reservations") }
    private val IS_SEAT_FREE by lazy { session.prepare("SELECT is_free FROM seats WHERE flight_id = ? AND seat_no = ?") }
    private val GET_FLIGHTS_BY_DAY_AND_DEPARTURE by lazy { session.prepare("SELECT * FROM flights WHERE departure = '?' AND date = '?'") }
    private val GET_FREE_SEATS_COUNT_BY_FLIGHT by lazy { session.prepare("SELECT count FROM free_seats WHERE flight_id = ?") }
    private val GET_FREE_SEATS_BY_FLIGHT by lazy { session.prepare("SELECT * FROM seats WHERE flight_id = ? AND is_free = true") }

    fun isSeatFree(flightId: FlightId, seatNo: SeatNo): Boolean {
        val result = session.execute(BoundStatement(IS_SEAT_FREE).bind(flightId, seatNo)).map { r -> r.getBool("is_free") }
        logger.info(IS_SEAT_FREE.toString())
        return if (result.size == 1) result[0] else throw RuntimeException("Should not happen")
    }

    fun getFlights(day: String, departure: String): List<Flight> {
        val result =  session.execute(BoundStatement(GET_FLIGHTS_BY_DAY_AND_DEPARTURE).bind(departure, day)).map { r -> Flight(r) }
        logger.info(GET_FLIGHTS_BY_DAY_AND_DEPARTURE.toString())
        return result
    }

    fun getFreeSeatsCount(flightId: FlightId): Int {
        val result = session.execute(BoundStatement(GET_FREE_SEATS_COUNT_BY_FLIGHT).bind(flightId)).map { r -> r.getInt("count") }
        logger.info(GET_FREE_SEATS_COUNT_BY_FLIGHT.toString())
        return if (result.size == 1) result[0] else throw RuntimeException("Should not happen")
    }

    fun getFreeSeats(flightId: FlightId): List<Seat> {
        val result = session.execute(BoundStatement(GET_FREE_SEATS_BY_FLIGHT).bind(flightId)).map { r -> Seat(r) }
        logger.info(GET_FREE_SEATS_BY_FLIGHT.toString())
        return result
    }

    // Probably will be unused
    fun getAllReservations(): List<Reservation> {
        val result = session.execute(BoundStatement(GET_ALL_RESERVATIONS)).map { r -> Reservation(r) }
        logger.info(GET_ALL_RESERVATIONS.toString())
        return result
    }

    // TODO make reservation, delete or modify reservation

    companion object {
        private val logger = LoggerFactory.getLogger(BackendSession::class.java)
    }
}
