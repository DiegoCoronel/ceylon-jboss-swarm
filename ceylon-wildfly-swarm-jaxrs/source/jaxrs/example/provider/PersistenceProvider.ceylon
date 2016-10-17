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

	suppressWarnings("unusedDeclaration")
	produces persistenceContext
	late EntityManager entityManager;

}
