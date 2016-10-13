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

entity
table { name = "REST_DB_ACCESS"; }
shared class Employee(name, id = 0) {
	
	id
	generatedValue { strategy = auto; }
	shared Integer id;
	
	column { length = 40; }
	shared String name;
	
}