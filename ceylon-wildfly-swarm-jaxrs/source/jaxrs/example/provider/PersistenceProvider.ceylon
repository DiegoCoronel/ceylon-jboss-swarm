import ceylon.interop.persistence {
	EntityManager
}

import javax.enterprise.context {
	requestScoped
}
import javax.enterprise.inject {
	produces
}
import javax.persistence {
	persistenceContext,
	JEntityManager=EntityManager
}

requestScoped
shared class PersistenceProvider() {

	persistenceContext
	late JEntityManager jpaEntityManager;

	produces shared EntityManager entityManager
			=> EntityManager(jpaEntityManager);

}
