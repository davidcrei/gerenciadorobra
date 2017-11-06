package br.com.gerenciadorobra.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.gerenciadorobra.models.Funcionario;

@Repository
@Transactional
public class FuncionarioDao {
	@PersistenceContext
	private EntityManager manager;

	public void gravar(Funcionario funcionario) {
		manager.persist(funcionario);
	}
}
