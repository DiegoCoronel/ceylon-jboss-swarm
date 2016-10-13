import ceylon.interop.java {
	javaClass
}
import jaxrs.example.entity {
	Employee
}
import jaxrs.example.resource {
	EmployeeResource
}
import org.jboss.shrinkwrap.api.asset {
	ClassLoaderAsset
}
import org.wildfly.swarm.jaxrs {
	JAXRSArchive
}
import org.jboss.shrinkwrap.api {
	ShrinkWrap
}
import jaxrs.example.provider {
	PersistenceProvider
}
import jaxrs.example.service {
	EmployeeService
}

JAXRSArchive newJaxRsExampleDeployment {
	JAXRSArchive deployment = ShrinkWrap.create(javaClass<JAXRSArchive>());

	//Application Configuration
	deployment.addClasses(javaClass<RestApplication>());

	//Providers
	deployment.addClasses(javaClass<PersistenceProvider>());

	//Entities
	deployment.addClasses(javaClass<Employee>());
	
	//Services
	deployment.addClasses(javaClass<EmployeeService>());
	
	//Resources
	deployment.addResource(javaClass<EmployeeResource>());
	
	//Resources
	deployment.addAsWebInfResource(
		ClassLoaderAsset("META-INF/persistence.xml", javaClass<RestApplication>().classLoader), 
		"classes/META-INF/persistence.xml"
	);
	deployment.addAsWebInfResource(
		ClassLoaderAsset("META-INF/load.sql", javaClass<RestApplication>().classLoader), 
		"classes/META-INF/load.sql"
	);
	deployment.addAllDependencies();
	
	return deployment;
}