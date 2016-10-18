import java.util {
	JList=List
}

import javax.inject {
	inject
}
import javax.ws.rs {
	path,
	produces,
	get,
	post,
	consumes,
	queryParam
}

import jaxrs.example.entity {
	Employee
}
import jaxrs.example.service {
	EmployeeService
}

path("/employee")
shared class EmployeeResource() {

	//we can't use constructor injection
	//with JAX-RS (field or method only)
	inject late EmployeeService service;

	get
	produces(["application/json"])
	shared default JList<Employee> get(
		queryParam("name") String? name,
		queryParam("max") Integer? max)
			=> if (exists name)
			then service.employeesForName(name)
			else service.allEmployees(max else 100);
	
	post
	consumes(["application/json"])
	produces(["application/json"])
	shared default Employee persist(Employee employee) {
		service.persist(employee);
		return employee;
	}

}