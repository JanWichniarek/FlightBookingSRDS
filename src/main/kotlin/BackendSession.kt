import com.datastax.driver.core.*
import org.slf4j.LoggerFactory

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

class BackendSession(contactPoint: String, keyspace: String) {

    private var session: Session

    init {
        val cluster = Cluster.builder().addContactPoint(contactPoint).build()
        session = cluster.connect(keyspace)
    }

    private fun prepareStatements() {
        SELECT_ALL_BOOKINGS = session.prepare("SELECT * FROM bookings")
        logger.info("Statements prepared")
    }

    fun selectAllBookings(): List<Booking> {
        val boundStatement = BoundStatement(SELECT_ALL_BOOKINGS)
        val resultSet = session.execute(boundStatement)
        val bookings = mutableListOf<Booking>()
        for (row in resultSet) {
            val id = row.getLong("id")
            val flightId = row.getLong("flightId")
            val seatId = row.getLong("seatId")
            val clientName = row.getString("clientName")
            bookings.add(Booking(id, flightId, seatId, clientName))
        }
        logger.info("SELECT_ALL_BOOKINGS")

        return bookings
    }

    fun prepare(s: String): PreparedStatement {
        return session.prepare(s)
    }

    fun execute(bs: BoundStatement): ResultSet {
        return session.execute(bs)
    }

    companion object {
        private val logger = LoggerFactory.getLogger(BackendSession::class.java)

        private lateinit var SELECT_ALL_BOOKINGS: PreparedStatement
    }
}
