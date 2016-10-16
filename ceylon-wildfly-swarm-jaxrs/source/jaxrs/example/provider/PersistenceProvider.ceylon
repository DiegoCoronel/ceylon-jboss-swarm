import javax.enterprise.context {
	requestScoped
}
import javax.enterprise.inject {
	produces
}
import javax.persistence {
	persistenceContext,
	EntityManager
}

requestScoped
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


//produces requestScoped persistenceContext
//late EntityManager entityManager;
