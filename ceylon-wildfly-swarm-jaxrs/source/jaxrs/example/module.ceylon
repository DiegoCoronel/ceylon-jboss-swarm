native("jvm")
module jaxrs.example "1.0.0" {
	shared import java.base "8";

	shared import maven:"org.wildfly.swarm:jaxrs-cdi" "2016.9";
	shared import maven:"org.wildfly.swarm:jpa" "2016.9";
	shared import maven:"org.wildfly.swarm:ejb" "2016.9";
	shared import maven:"org.wildfly.swarm:datasources" "2016.9";

	shared import maven:"com.h2database:h2" "1.4.187";
	shared import maven:"org.hibernate.javax.persistence:hibernate-jpa-2.1-api" "1.0.0.Final";
	import ceylon.interop.java "1.3.0";
}
