import javax.enterprise.context {
	applicationScoped
}
import javax.enterprise.inject {
	produces
}
import javax.persistence {
	persistenceContext,
	EntityManager
}

applicationScoped
shared class PersistenceProvider() {

	persistenceContext
	late EntityManager entityManager;

	produces
	shared EntityManager getEntityManager()
			=> entityManager;
}
