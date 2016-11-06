import ceylon.interop.persistence {
	EntityManager
}

import java.util {
	List
}

import javax.ejb {
	stateless,
	localBean
}
import javax.inject {
	inject
}
import javax.transaction {
	transactional
}

import jaxrs.example.entity {
	Employee
}

inject
stateless
localBean
shared class EmployeeService(EntityManager entityManager) {

	transactional
	shared void persist(Employee employee) {
//		assert (employee.id is Null);
		entityManager.persist(employee);
	}

	shared Employee? employeeForId(Integer id)
			=> entityManager.find(`Employee`, id);

	shared List<out Employee> employeesForName(String name)
			=> entityManager
				.Query(`Employee`, "from Employee e where e.name = :name")
				.setArgument("name", name)
				.getJavaResultList();

	shared List<out Employee> allEmployees(Integer max)
			=> entityManager
				.Query(`Employee`, "from Employee", max)
				.getJavaResultList();

}