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
typealias ReservationId = UUID
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
    private val GET_RESERVATIONS_BY_FLIGHT_AND_SEAT by lazy { session.prepare("SELECT * FROM reservations WHERE flight_id = ? and seat_no = ?;") }
    private val IS_SEAT_FREE by lazy { session.prepare("SELECT is_free FROM seats WHERE flight_id = ? AND seat_no = ?;") }
    private val GET_ALL_FLIGHTS  by lazy { session.prepare("SELECT * FROM flights;") }
    private val GET_FLIGHTS_BY_DAY_AND_DEPARTURE by lazy { session.prepare("SELECT * FROM flights WHERE departure = ? AND date = ?;") }
    private val GET_FREE_SEATS_COUNT_BY_FLIGHT by lazy { session.prepare("SELECT count FROM free_seats WHERE flight_id = ?;") }
    private val GET_FREE_SEATS_BY_FLIGHT by lazy { session.prepare("SELECT * FROM seats WHERE flight_id = ? AND is_free = true;") }
    private val INSERT_NEW_RESERVATION by lazy { session.prepare("INSERT INTO reservations (id, flight_id, passenger, seat_no) VALUES (?, ?, ?, ?);") }
    private val UPDATE_RESERVATION_PASSENGER by lazy { session.prepare("UPDATE reservations SET passenger = ? WHERE flight_id = ? AND seat_no = ? AND id = ? IF EXISTS;") }
    private val DELETE_RESERVATION by lazy { session.prepare("DELETE passenger FROM reservations WHERE flight_id = ? AND seat_no = ? AND id = ? IF EXISTS;") }
    private val DELETE_ALL_RESERVATIONS_FOR_SEAT_AND_FLIGHT by lazy { session.prepare("DELETE passenger FROM reservations WHERE flight_id = ? AND seat_no = ? AND id = ?;") }
    private val SET_FREE_SEATS_COUNT by lazy { session.prepare("UPDATE free_seats SET count = count + ? WHERE flight_id = ?;") }
    private val SET_SEAT_IS_FREE by lazy { session.prepare("UPDATE seats SET is_free = ? WHERE flight_id = ? AND seat_no = ?;") }

    fun isSeatFree(flightId: FlightId, seatNo: SeatNo): Boolean {
        val result = session
            .execute(BoundStatement(IS_SEAT_FREE).bind(flightId, seatNo))
            .map { r -> r.getBool("is_free") }
        logger.debug(IS_SEAT_FREE.toString())
        return if (result.size == 1) result[0] else throw RuntimeException("Should not happen")
    }

    fun getFlights(): List<Flight> {
        val result = session
            .execute(BoundStatement(GET_ALL_FLIGHTS))
            .map { r -> Flight(r) }
        logger.debug(GET_ALL_FLIGHTS.toString())
        return result
    }

    fun getFlights(day: String, departure: String): List<Flight> {
        val result = session
            .execute(BoundStatement(GET_FLIGHTS_BY_DAY_AND_DEPARTURE).bind(departure, day))
            .map { r -> Flight(r) }
        logger.debug(GET_FLIGHTS_BY_DAY_AND_DEPARTURE.toString())
        return result
    }

    fun getFreeSeatsCount(flightId: FlightId): Int {
        val result = session
            .execute(BoundStatement(GET_FREE_SEATS_COUNT_BY_FLIGHT).bind(flightId))
            .map { r -> r.getInt("count") }
        logger.debug(GET_FREE_SEATS_COUNT_BY_FLIGHT.toString())
        return if (result.size == 1) result[0] else throw RuntimeException("Should not happen")
    }

    fun getFreeSeats(flightId: FlightId): List<Seat> {
        val result = session
            .execute(BoundStatement(GET_FREE_SEATS_BY_FLIGHT).bind(flightId))
            .map { r -> Seat(r) }
        logger.debug(GET_FREE_SEATS_BY_FLIGHT.toString())
        return result
    }

    fun getAllReservations(): List<Reservation> {
        val result = session
            .execute(BoundStatement(GET_ALL_RESERVATIONS))
            .map { r -> Reservation(r) }
        logger.debug(GET_ALL_RESERVATIONS.toString())
        return result
    }

    fun getReservations(flightId: FlightId): List<Reservation> {
        val result = session
            .execute(BoundStatement(GET_RESERVATIONS_BY_FLIGHT).bind(flightId))
            .map { r -> Reservation(r) }
        logger.debug(GET_RESERVATIONS_BY_FLIGHT.toString())
        return result
    }

    fun getReservations(flightId: FlightId, seatNo: SeatNo): List<Reservation> {
        val result = session
            .execute(BoundStatement(GET_RESERVATIONS_BY_FLIGHT_AND_SEAT).bind(flightId, seatNo))
            .filter { r -> r.getString("passenger") != null }
            .map { r -> Reservation(r) }
        logger.debug(GET_RESERVATIONS_BY_FLIGHT_AND_SEAT.toString())
        return result
    }

    fun createNewReservation(passenger: Passenger, flightId: FlightId, seatNo: SeatNo) : ReservationId {
        val reservationUuid = UUID.randomUUID()
        setSeatIsFree(false, flightId, seatNo)
        changeFreeSeatsCount(-1L, flightId)
        insertNewReservation(reservationUuid, flightId, seatNo, passenger)
        return reservationUuid
    }

    fun updateReservationPassenger(newPassenger: Passenger, flightId: FlightId, seatNo: SeatNo, id: ReservationId) {
        session.execute(BoundStatement(UPDATE_RESERVATION_PASSENGER).bind(newPassenger, flightId, seatNo, id))
        logger.debug(UPDATE_RESERVATION_PASSENGER.toString())
    }

    /**
     * Cancel reservations for this seat and increment free seats counter.
     * Delete ALL reservation for this seat to ensure safe/proper setting of seat as free.
     */
    fun cancelReservations(flightId: FlightId, seatNo: SeatNo) {
        changeFreeSeatsCount(1L, flightId)
        // TODO how many times decrement counter?
        setSeatIsFree(true, flightId, seatNo)
        deleteAllReservationsForThisSeatAndFlight(flightId, seatNo)
    }

    /**
     * Cancel redundant reservation for this seat and increment free seats counter.
     * Delete ONLY ONE reservation for this seat (the redundant one).
     * DO NOT set seat as free because it is still reserved by another reservation.
     */
    fun cancelReservation(flightId: FlightId, seatNo: SeatNo, reservationId: ReservationId) {
        changeFreeSeatsCount(1L, flightId)
        if (getReservations(flightId, seatNo).size == 1) {
            setSeatIsFree(true, flightId, seatNo)
        }
        deleteReservation(reservationId, flightId, seatNo)
    }

    private fun insertNewReservation(reservationId: ReservationId, flightId: FlightId, seatNo: SeatNo, passenger: Passenger) {
        session.execute(BoundStatement(INSERT_NEW_RESERVATION).bind(reservationId, flightId, passenger, seatNo))
        logger.debug(INSERT_NEW_RESERVATION.toString())
    }

    // TODO unused counter!
    private fun changeFreeSeatsCount(toAddToCounterValue: Long, flightId: FlightId) {
        session.execute(BoundStatement(SET_FREE_SEATS_COUNT).bind(toAddToCounterValue, flightId))
        logger.info(SET_FREE_SEATS_COUNT.toString())
    }

    private fun setSeatIsFree(newIsFreeValue: Boolean, flightId: FlightId, seatNo: SeatNo) {
        session.execute(BoundStatement(SET_SEAT_IS_FREE).bind(newIsFreeValue, flightId, seatNo))
        logger.debug(SET_SEAT_IS_FREE.toString())
    }

    private fun deleteReservation(reservationId: ReservationId, flightId: FlightId, seatNo: SeatNo) {
        val result = session.execute(BoundStatement(DELETE_RESERVATION).bind(flightId, seatNo, reservationId))
        logger.debug(DELETE_RESERVATION.toString())
    }

    private fun deleteAllReservationsForThisSeatAndFlight(flightId: FlightId, seatNo: SeatNo) {
        val result = session.execute(BoundStatement(DELETE_ALL_RESERVATIONS_FOR_SEAT_AND_FLIGHT).bind(flightId, seatNo))
        logger.debug(DELETE_ALL_RESERVATIONS_FOR_SEAT_AND_FLIGHT.toString())
    }

    private fun finalize() {
        try {
            session.cluster.close()
        } catch (e: Exception) {
            logger.error("Could not close existing cluster", e)
        }
    }

    companion object {
        private val logger = LoggerFactory.getLogger(BackendSession::class.java)
    }
}
