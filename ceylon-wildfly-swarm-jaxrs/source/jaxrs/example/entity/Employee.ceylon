import javax.persistence {
	id,
	generatedValue,
	column,
	GenerationType {
		auto
	},
	entity,
	table
}

import java.lang {
	JInteger = Integer
}

entity
table{ name = "REST_DB_ACCESS"; }
shared class Employee(name, id = null) {
	
	id
	generatedValue{strategy = auto;}
	shared JInteger? id;
	
	column{length = 40;}
	shared String name;
	
}