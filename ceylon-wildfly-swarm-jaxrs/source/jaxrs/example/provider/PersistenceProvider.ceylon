import javax.enterprise.context {
	applicationScoped
}
import javax.persistence {
	persistenceContext = persistenceContext__FIELD,
	EntityManager
}
import javax.enterprise.inject {
	produces
}

applicationScoped
shared class PersistenceProvider() {
	
	persistenceContext
	late EntityManager entityManager;
	
	produces
	shared EntityManager getEntityManager() {
		return entityManager;
	}
}
