import javax.persistence {
	id,
	generatedValue,
	column,
	entity
}

shared entity class Employee(name) {

	generatedValue id
    shared late Integer id;
	
	column { length = 50; }
	shared String name;

	column
	shared variable Integer? year = null;

}
