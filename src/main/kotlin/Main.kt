import java.util.*

private val PROPERTIES_FILENAME = "config.properties"

fun main(args: Array<String>) {

    val properties = Properties();
    properties.load(object {}.javaClass.getResourceAsStream(PROPERTIES_FILENAME))
    val contactPoint = properties.getProperty("contact_point")
    val keyspace = properties.getProperty("keyspace")
    val backendSession = BackendSession(contactPoint, keyspace)
}

