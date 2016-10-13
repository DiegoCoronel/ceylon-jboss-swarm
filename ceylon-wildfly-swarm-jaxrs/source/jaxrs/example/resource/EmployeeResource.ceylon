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
	inject
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

	late EntityManager entityManager;

	late EmployeeService service;

	inject
	shared void init(EntityManager entityManager,
					 EmployeeService service) {
		this.entityManager = entityManager;
		this.service = service;
	}

	get
	produces(["application/json"])
	shared default JList<Employee> get()
			=> entityManager.createQuery("from Employee", javaClass<Employee>()).resultList;
	
	post
	consumes(["application/json"])
	produces(["application/json"])
	shared default Employee persist(Employee employee) {
		service.persist(employee);
		return employee;
	}
	
}