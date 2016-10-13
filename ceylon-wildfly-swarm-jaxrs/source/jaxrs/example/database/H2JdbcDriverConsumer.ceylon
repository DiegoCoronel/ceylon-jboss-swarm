import org.wildfly.swarm.config.datasources {
	JDBCDriver,
	JDBCDriverConsumer
}

shared class H2JdbcDriverConsumer<T>() satisfies JDBCDriverConsumer<T>
		given T satisfies JDBCDriver<T> {
	
	shared actual void accept(T d) {
		d.driverClassName("org.h2.Driver");
		d.xaDatasourceClass("org.h2.jdbcx.JdbcDataSource");
		d.driverModuleName("com.h2database.h2");	
	}
}