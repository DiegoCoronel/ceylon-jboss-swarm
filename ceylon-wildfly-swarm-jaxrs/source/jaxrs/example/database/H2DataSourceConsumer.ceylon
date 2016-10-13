import org.wildfly.swarm.config.datasources {
	DataSourceConsumer,
	DataSource
}

shared class H2DataSourceConsumer<T>() satisfies DataSourceConsumer<T>
		given T satisfies DataSource<T> {
	shared actual void accept(T ds) {
		ds.driverName("h2");
		ds.connectionUrl("jdbc:h2:mem:test;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE");
		ds.userName("sa"); 
		ds.password("sa"); 
	}
}