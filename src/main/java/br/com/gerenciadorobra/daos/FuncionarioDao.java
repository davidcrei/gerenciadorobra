package br.com.gerenciadorobra.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.gerenciadorobra.models.Funcionario;
import br.com.gerenciadorobra.models.Obra;

@Repository
@Transactional
public class FuncionarioDao {
	@PersistenceContext
	private EntityManager manager;

	public void gravar(Funcionario funcionario) {
		manager.persist(funcionario);
	}
	
	public List<Funcionario> listaFuncionario() {
		Query lQuery = manager.createQuery("from Funcionario");
		List<Funcionario> funcionarioList = (List<Funcionario>)lQuery.getResultList();;
		return funcionarioList;
	}
	
	
}
