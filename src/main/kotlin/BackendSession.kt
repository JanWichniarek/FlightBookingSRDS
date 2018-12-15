import com.datastax.driver.core.*
import model.Flight
import model.Reservation
import model.Seat
import org.slf4j.LoggerFactory
import kotlin.RuntimeException
import java.util.UUID

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

typealias FlightId = UUID
typealias SeatNo = Int
typealias Passenger = String

class BackendSession(contactPoint: String, keyspace: String) {

    private val session: Session

    init {
        val cluster = Cluster.builder().addContactPoint(contactPoint).build()
        session = cluster.connect(keyspace)
    }

    private val GET_ALL_RESERVATIONS by lazy { session.prepare("SELECT * FROM reservations;") }
    private val GET_RESERVATIONS_BY_FLIGHT by lazy { session.prepare("SELECT * FROM reservations WHERE flight_id = ?;") }
    private val GET_RESERVATION_ID_BY_FLIGHT_AND_SEAT by lazy { session.prepare("SELECT id FROM reservations WHERE flight_id = ? and seat_no = ?;") }
    private val IS_SEAT_FREE by lazy { session.prepare("SELECT is_free FROM seats WHERE flight_id = ? AND seat_no = ?;") }
    private val GET_FLIGHTS_BY_DAY_AND_DEPARTURE by lazy { session.prepare("SELECT * FROM flights WHERE departure = ? AND date = ?;") }
    private val GET_FREE_SEATS_COUNT_BY_FLIGHT by lazy { session.prepare("SELECT count FROM free_seats WHERE flight_id = ?;") }
    private val GET_FREE_SEATS_BY_FLIGHT by lazy { session.prepare("SELECT * FROM seats WHERE flight_id = ? AND is_free = true;") }
    private val INSERT_NEW_RESERVATION by lazy { session.prepare("INSERT INTO reservations (flight_id, passenger, seat_no) VALUES (?, ?, ?);") }
    private val UPDATE_RESERVATION_PASSENGER by lazy { session.prepare("UPDATE reservations SET passenger = ? WHERE flight_id = ? AND seat_no = ? IF EXISTS;") }
    private val DELETE_RESERVATION by lazy { session.prepare("DELETE flight_id, passenger, seat_no FROM reservations WHERE flight_id = ? AND seat_no = ? IF EXISTS;") }
    private val SET_FREE_SEATS_COUNT by lazy { session.prepare("UPDATE free_seats SET count = count + ? WHERE flight_id = ?;") }
    private val SET_SEAT_IS_FREE by lazy { session.prepare("UPDATE seats SET is_free = ? WHERE flight_id = ? AND seat_no = ?;") }

    fun isSeatFree(flightId: FlightId, seatNo: SeatNo): Boolean {
        val result = session
            .execute(BoundStatement(IS_SEAT_FREE).bind(flightId, seatNo))
            .map { r -> r.getBool("is_free") }
        logger.info(IS_SEAT_FREE.toString())
        return if (result.size == 1) result[0] else throw RuntimeException("Should not happen")
    }

    fun getFlights(day: String, departure: String): List<Flight> {
        val result = session
            .execute(BoundStatement(GET_FLIGHTS_BY_DAY_AND_DEPARTURE).bind(departure, day))
            .map { r -> Flight(r) }
        logger.info(GET_FLIGHTS_BY_DAY_AND_DEPARTURE.toString())
        return result
    }

    fun getFreeSeatsCount(flightId: FlightId): Int {
        val result = session
            .execute(BoundStatement(GET_FREE_SEATS_COUNT_BY_FLIGHT).bind(flightId))
            .map { r -> r.getInt("count") }
        logger.info(GET_FREE_SEATS_COUNT_BY_FLIGHT.toString())
        return if (result.size == 1) result[0] else throw RuntimeException("Should not happen")
    }

    fun getFreeSeats(flightId: FlightId): List<Seat> {
        val result = session
            .execute(BoundStatement(GET_FREE_SEATS_BY_FLIGHT).bind(flightId))
            .map { r -> Seat(r) }
        logger.info(GET_FREE_SEATS_BY_FLIGHT.toString())
        return result
    }

    fun getAllReservations(): List<Reservation> {
        val result = session
            .execute(BoundStatement(GET_ALL_RESERVATIONS))
            .map { r -> Reservation(r) }
        logger.info(GET_ALL_RESERVATIONS.toString())
        return result
    }

    fun getReservation(flightId: FlightId): List<Reservation> {
        val result = session
            .execute(BoundStatement(GET_RESERVATIONS_BY_FLIGHT).bind(flightId))
            .map { r -> Reservation(r) }
        logger.info(GET_RESERVATIONS_BY_FLIGHT.toString())
        return result
    }

    fun getReservation(flightId: FlightId, seatNo: SeatNo): Reservation? {
        val result = session
            .execute(BoundStatement(GET_RESERVATION_ID_BY_FLIGHT_AND_SEAT).bind(flightId, seatNo))
            .map { r -> Reservation(r) }
        logger.info(GET_RESERVATION_ID_BY_FLIGHT_AND_SEAT.toString())
        if (result.size == 1) return result[0]
        else if (result.isEmpty()) return null
        else throw RuntimeException("Should not happen")
    }

    fun createNewReservation(passenger: Passenger, flightId: FlightId, seatNo: SeatNo) {
        setSeatIsFree(false, flightId, seatNo)
        changeFreeSeatsCount(-1, flightId)
        insertNewReservation(flightId, seatNo, passenger)
        return reservationUuid
    }

    fun updateReservationPassenger(newPassenger: Passenger, flightId: FlightId, seatNo: SeatNo) {
        session.execute(BoundStatement(UPDATE_RESERVATION_PASSENGER).bind(newPassenger, flightId, seatNo))
        logger.info(UPDATE_RESERVATION_PASSENGER.toString())
    }

    fun cancelReservation(flightId: FlightId, seatNo: SeatNo) {
        changeFreeSeatsCount(1, flightId)
        setSeatIsFree(true, flightId, seatNo)
        deleteReservation(flightId, seatNo)
    }

    private fun insertNewReservation(flightId: FlightId, seatNo: SeatNo, passenger: Passenger) {
        session.execute(BoundStatement(INSERT_NEW_RESERVATION).bind(flightId, passenger, seatNo))
        logger.info(INSERT_NEW_RESERVATION.toString())
    }

    private fun changeFreeSeatsCount(toAddToCounterValue: Int, flightId: FlightId) {
//        session.execute(BoundStatement(SET_FREE_SEATS_COUNT).bind(toAddToCounterValue, flightId))
//        logger.info(SET_FREE_SEATS_COUNT.toString())
//        logger.info("Counter temporarily disabled")
    }

    private fun setSeatIsFree(newIsFreeValue: Boolean, flightId: FlightId, seatNo: SeatNo) {
        session.execute(BoundStatement(SET_SEAT_IS_FREE).bind(newIsFreeValue, flightId, seatNo))
        logger.info(SET_SEAT_IS_FREE.toString())
    }

    private fun deleteReservation(flightId: FlightId, seatNo: SeatNo) {
        val result = session.execute(BoundStatement(DELETE_RESERVATION).bind(flightId, seatNo))
        logger.info(DELETE_RESERVATION.toString())
    }

    companion object {
        private val logger = LoggerFactory.getLogger(BackendSession::class.java)
    }
}
