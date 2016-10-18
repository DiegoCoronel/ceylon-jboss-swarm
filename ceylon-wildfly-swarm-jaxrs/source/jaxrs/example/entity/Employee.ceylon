import javax.persistence {
	id,
	generatedValue,
	column,
	GenerationType {
		auto
	},
	entity
}

import javax.xml.bind.annotation.adapters {
	xmlJavaTypeAdapter
}

shared entity class Employee(name, id=0, year=null) {

	generatedValue { strategy = auto; }
	shared id Integer id;
	
	column { length = 40; }
	shared String name;

	column
	xmlJavaTypeAdapter(`class IntegerAdapter`)
	shared Integer? year;

}
