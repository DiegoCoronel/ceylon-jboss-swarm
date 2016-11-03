import ceylon.interop.java {
    javaString
}

import java.util {
    JList=List
}

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
import java.lang {
    Long
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
			=> entityManager.find<Employee>(`class Employee`, Long(id));

	shared JList<Employee> employeesForName(String name)
			=> entityManager
				.createQuery<Employee>(
						"from Employee e where e.name = :name",
						 `class Employee`)
				.setParameter("name", javaString(name))
				.resultList;

	shared JList<Employee> allEmployees(Integer max)
			=> entityManager
				.createQuery<Employee>(
						"from Employee",
						`class Employee`)
				.setMaxResults(max)
				.resultList;


}