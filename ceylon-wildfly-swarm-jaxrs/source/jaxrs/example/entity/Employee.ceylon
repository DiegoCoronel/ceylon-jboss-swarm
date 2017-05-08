import javax.persistence {
	id,
	generatedValue,
	column,
	entity,
	manyToOne,
	oneToMany,
	FetchType {
		...
	}
}
import javax.xml.bind.annotation {
	xmlID,
	xmlIDREF,
	xmlTransient,
	xmlAttribute
}

shared entity class Employee(name, manager) {

	xmlAttribute xmlID
	generatedValue id
	shared late Integer id;

	column { length = 50; }
	shared String name;

	shared variable Integer? year = null;

	xmlIDREF
	manyToOne
	shared variable Employee? manager;

	xmlTransient
	oneToMany { mappedBy = "manager"; }
	shared Set<Employee> employees = set {};

}
