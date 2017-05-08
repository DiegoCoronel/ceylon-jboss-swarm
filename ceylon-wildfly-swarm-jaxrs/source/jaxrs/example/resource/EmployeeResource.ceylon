import java.util {
	List,
	Arrays {
		asList
	}
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
import javax.transaction {
	transactional
}

path("/employee")
shared class EmployeeResource() {

	//we can't use constructor injection
	//with JAX-RS (field or method only)
	inject late EmployeeService service;

	get
	produces {"application/json"}
	shared List<out Employee> get(
		queryParam("name") String? name,
		queryParam("id") Integer? id,
		queryParam("max") Integer? max)
			=> if (exists id)
				then asList(if (exists emp = service.employeeForId(id)) emp)
			else if (exists name)
				then service.employeesForName(name)
			else service.allEmployees(max else 100);
	
	post
	consumes {"application/json"}
	produces {"application/json"}
	shared Employee persist(Employee employee) {
		service.persist(employee);
		return employee;
	}

	path("manager") get
	produces {"application/json"}
	transactional
	shared Employee? manager(
		queryParam("employee") Integer id)
			=> service.employeeForId(id)?.manager;

	path("employees") get
	produces {"application/json"}
	transactional
	shared List<Employee>? employees(
		queryParam("manager") Integer id)
			=> if (exists manager = service.employeeForId(id))
			then asList(*manager.employees)
			else null;

	path("manager") post
	produces {"application/json"}
	shared Employee setManager(
		queryParam("employee") Integer employeeId,
		queryParam("manager") Integer? managerId)
			=> service.setManager(employeeId, managerId);
}