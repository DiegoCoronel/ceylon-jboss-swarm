native("jvm")
module jaxrs.example "1.0.0" {
	shared import javax.javaeeapi "7.0";
	import ceylon.interop.persistence "1.3.1";
	module ceylon.interop.persistence "1.3.1" {
		module maven:org.hibernate.javax.persistence:"hibernate-jpa-2.1-api" "1.0.0.Final"
			=> import javax.javaeeapi "7.0";
	}
}
