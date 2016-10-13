import ceylon.interop.java {
	javaClass
}

import java.util {
	JList=List
}
import javax.enterprise.context {
	applicationScoped
}
import javax.inject {
	inject = inject__FIELD
}
import javax.persistence {
	EntityManager
}
import javax.ws.rs {
	path,
	produces,
	get,
	post,
	consumes
}

import jaxrs.example.entity {
	Employee
}
import jaxrs.example.service {
	EmployeeService
}

path("/employee")
applicationScoped
shared class EmployeeResource() {

	inject
	late EntityManager entityManager;
	
	inject
	late EmployeeService service;
	
	get
	produces({"application/json"})	
	shared default JList<Employee> get() => entityManager.createQuery("FROM Employee", javaClass<Employee>()).resultList;
	
	post
	consumes({"application/json"})
	produces({"application/json"})	
	
	shared default Employee persist(Employee employee) {
		service.persist(employee);
		return employee;
	}
	
}