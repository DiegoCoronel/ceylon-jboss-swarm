import javax.ws.rs {
	applicationPath
}
import javax.ws.rs.core {
	Application
}

applicationPath("/rest")
shared class RestApplication() extends Application() {}
