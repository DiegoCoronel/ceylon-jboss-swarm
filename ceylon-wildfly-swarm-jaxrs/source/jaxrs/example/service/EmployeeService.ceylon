import javax.ejb {
	stateless,
	localBean
}
import javax.inject {
	inject
}
import javax.persistence {
	EntityManager
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
	shared default void persist(Employee employee) {
		assert (employee.id == 0);
		entityManager.persist(employee);
	}
	
}