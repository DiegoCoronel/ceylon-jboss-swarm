import javax.persistence {
	id,
	generatedValue,
	column,
	GenerationType {
		auto
	},
	entity
}
import java.lang {
    Long
}
import javax.xml.bind.annotation.adapters {
	xmlJavaTypeAdapter
}

shared entity class Employee(name, id = null, year=null) {
	
	id
	generatedValue { strategy = auto; }
	shared Long? id;
	
	column { length = 40; }
	xmlJavaTypeAdapter(`class StringAdapter`)
	shared String? name;

	column
	xmlJavaTypeAdapter(`class IntegerAdapter`)
	shared Integer? year;

}
