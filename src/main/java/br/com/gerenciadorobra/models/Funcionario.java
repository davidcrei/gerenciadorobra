package br.com.gerenciadorobra.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Funcionario {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY) 
	private Integer id;
	private String nome;
	private String cpf;
	
	@OneToOne
	private DocumentoDigitalizado documentoDigitalizado;
	
	@ManyToOne
	private Obra obra;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public Obra getObra() {
		return obra;
	}
	public void setObra(Obra obra) {
		this.obra = obra;
	}

	
	
}
