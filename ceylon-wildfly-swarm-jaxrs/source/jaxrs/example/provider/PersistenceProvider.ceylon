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

	late EntityManager entityManager;

	persistenceContext
	shared void setPersistenceContext(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	produces
	shared EntityManager getEntityManager()
			=> entityManager;
}
