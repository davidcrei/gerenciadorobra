package br.com.gerenciadorobra.models;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class HistObraFuncionario {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY) 
	private Integer id;
	
	@ManyToOne
	private Obra obra;
	@ManyToOne
	private Funcionario funcionario;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar dataInicio;
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar dataFim;
	
	public Integer getId() {
		return id;
	}
		public Obra getIdObra() {
		return obra;
	}
	
	public Obra getObra() {
		return obra;
	}

	public void setObra(Obra obra) {
		this.obra = obra;
	}

	public Funcionario getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public Calendar getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Calendar dataInicio) {
		this.dataInicio = dataInicio;
	}

	
	public Calendar getDataFim() {
		return dataFim;
	}
	public void setDataFim(Calendar dataFim) {
		this.dataFim = dataFim;
	}
	
	
}
