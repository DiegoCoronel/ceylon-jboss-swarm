import javax.ejb {
	stateless,
	localBean
}
import javax.transaction {
	transactional
}
import jaxrs.example.entity {
	Employee
}
import javax.inject {
	inject
}
import javax.persistence {
	EntityManager
}


inject
stateless
localBean
shared class EmployeeService(entityManager) {
	
	EntityManager entityManager;

	transactional
	shared default void persist(Employee employee) {
		assert(! employee.id exists);
		entityManager.persist(employee);
	}
	
}