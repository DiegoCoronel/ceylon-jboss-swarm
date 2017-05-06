import ceylon.interop.persistence {
    EntityManager
}
import ceylon.interop.persistence.criteria {
    equal
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
	shared void persist(Employee employee)
			=> entityManager.persist(employee);

	shared Employee? employeeForId(Integer id)
			=> entityManager.find(`Employee`, id);

	shared List<out Employee> employeesForName(String name) {
		value crit = entityManager.createCriteria();
		return
			let (e = crit.from(`Employee`))
			crit.where(equal(e.get(`Employee.name`),
					   crit.parameter(name)))
				.select(e)
				.getResultList();
	}

	shared List<out Employee> allEmployees(Integer max){
		value crit = entityManager.createCriteria();
		return
			crit.select(crit.from(`Employee`))
				.setMaxResults(max)
				.getResultList();
	}

}