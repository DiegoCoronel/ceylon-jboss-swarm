import java.util {
	JList=List
}

import javax.enterprise.context {
	applicationScoped
}
import javax.inject {
	inject
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

	//we can't use constructor injection
	//with JAX-RS (field or method only)
	inject late EmployeeService service;

	get
	produces(["application/json"])
	shared default JList<Employee> get()
			=> service.allEmployees();
	
	post
	consumes(["application/json"])
	produces(["application/json"])
	shared default Employee persist(Employee employee) {
		service.persist(employee);
		return employee;
	}

}