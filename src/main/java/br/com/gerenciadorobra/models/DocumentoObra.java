package br.com.gerenciadorobra.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class DocumentoObra {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY) 
	private int idDocumento;
	@ManyToMany
	private List<Obra> obra;
	
	public List<Obra> getObra() {
		return obra;
	}

	public void setObra(List<Obra> obra) {
		this.obra = obra;
	}

	private String nome;

	public int getIdDocumento() {
		return idDocumento;
	}

	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
