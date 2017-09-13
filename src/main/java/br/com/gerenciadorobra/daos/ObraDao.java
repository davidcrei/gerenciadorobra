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

}
