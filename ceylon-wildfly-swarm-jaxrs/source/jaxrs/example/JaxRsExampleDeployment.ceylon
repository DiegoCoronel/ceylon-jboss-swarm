import ceylon.interop.java {
	javaClass
}

import jaxrs.example.entity {
	Employee
}
import jaxrs.example.provider {
	PersistenceProvider
}
import jaxrs.example.resource {
	EmployeeResource
}
import jaxrs.example.service {
	EmployeeService
}

import org.jboss.shrinkwrap.api {
	ShrinkWrap
}
import org.jboss.shrinkwrap.api.asset {
	ClassLoaderAsset
}
import org.wildfly.swarm.jaxrs {
	JAXRSArchive
}

JAXRSArchive newJaxRsExampleDeployment {
	value deployment = ShrinkWrap.create(javaClass<JAXRSArchive>());

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

	function asset(String path)
			=> [ ClassLoaderAsset(path, javaClass<RestApplication>().classLoader),
				 "classes/" + path ];

	//Resources
	deployment.addAsWebInfResource(*asset("META-INF/persistence.xml"));
	deployment.addAsWebInfResource(*asset("META-INF/load.sql"));
	deployment.addAllDependencies();
	
	return deployment;
}