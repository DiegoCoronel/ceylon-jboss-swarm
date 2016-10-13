import org.wildfly.swarm {
	Swarm
}
import org.wildfly.swarm.datasources {
	DatasourcesFraction
}
import jaxrs.example.database {
	H2DataSourceConsumer,
	H2JdbcDriverConsumer
}

"Run the module `jaxrs.example`."
shared void run() {

    value swarm = Swarm();
    
    swarm.fraction(DatasourcesFraction()
         .jdbcDriver("h2", H2JdbcDriverConsumer())
         .dataSource("ExampleDS", H2DataSourceConsumer())
	);
	
	swarm.start();
	swarm.deploy(newJaxRsExampleDeployment);

}
