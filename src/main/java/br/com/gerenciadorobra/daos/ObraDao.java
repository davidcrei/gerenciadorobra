package br.com.gerenciadorobra.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.gerenciadorobra.models.Obra;

@Repository
@Transactional
public class ObraDao {

	@PersistenceContext
	private EntityManager manager;

	public void gravar(Obra obra) {
		manager.persist(obra);
	}

	@SuppressWarnings("unchecked")
	public List<Obra> findAll() {
		Query lQuery = manager.createQuery("from Obra");
		List<Obra> obraList = (List<Obra>)lQuery.getResultList();;
		return obraList;
	}

	public List<Obra> findListaPaginada(int numPagina) {
		StringBuilder sbQuery = new StringBuilder();
		Query query2 = null;
		sbQuery.append("select count(*) from Obra");
		//getSession, retorna a sessão do hibernate
		//Neste caso estou considerando que vc ja a possui
		query2 = manager.createQuery(sbQuery.toString());
		Long count = (Long)query2.getSingleResult();

		StringBuilder sbQuery2 = new StringBuilder();
		Query query = null;
		int maxRecords = 3;
		int paginas = 0;
		
		if(count > maxRecords) {
			paginas = (int) (count / maxRecords);
		}
		sbQuery2.append("from Obra");
		/*Esta linha indica a partir de qual registo sua lista sera formada
		Como maxRecords == 10, estou pegando o que seria a pagina 2.
		onde o meu primeiro registro é 1 * 10 = 10 
		A primeira pagina seria 0*10 = 0
		 */

		query = manager.createQuery(sbQuery2.toString());

		int registroInicial =  numPagina * maxRecords;
		query.setFirstResult(registroInicial);
		/*Esta linha indica quantos registros serão recuperados a partir do primeiro*/
		query.setMaxResults(maxRecords);
		List list = query.getResultList();	
		return list;
	}

}
