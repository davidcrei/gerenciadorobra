package br.com.gerenciadorobra.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.BindingResultUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.gerenciadorobra.daos.ObraDao;
import br.com.gerenciadorobra.models.Obra;

@RequestMapping("/cadastro")
@Controller
public class ObraController {

	@Autowired
	private ObraDao obraDao;


	@RequestMapping(value="/listar", method=RequestMethod.GET)
	public ModelAndView listar(Integer paginaAtual) {
		Obra obra = new Obra();
		//obra.setNome("G2O");

		if(paginaAtual == null) {
			paginaAtual = 1;
		}

		ArrayList<Integer> paginacao = listaPaginacao(obraDao); 
		List<Obra> obras  = obraDao.findListaPaginada(paginaAtual);

		ModelAndView modelAndView =  new ModelAndView("cadastro/obra");
		modelAndView.addObject("obra", obra);
		modelAndView.addObject("listaPaginacao", paginacao);
		modelAndView.addObject("obras", obras);

		return modelAndView;
	}


	@RequestMapping(value="/gravar", method=RequestMethod.POST)
	public ModelAndView gravar(@Valid Obra obra, BindingResult result) {
		//obra.setId(null);
		ModelAndView modelAndView = listar(null);
		if(result.hasErrors()) {
			return modelAndView;
		}
		obraDao.gravar(obra);
		
		return modelAndView;
		
	}

		
	@RequestMapping(value="/atualizar", method=RequestMethod.GET)
	public ModelAndView atualizar(Obra obra) {

		obraDao.atualizar(obra);
		ModelAndView modelAndView = listar(null);

		return modelAndView;
	}	
	
	
	@RequestMapping(value="/excluir/{id}", method=RequestMethod.GET)
	public ModelAndView excluir(@PathVariable("id") Integer id) {
		Obra obra = obraDao.buscaPorChavePrimaria(id);
		obraDao.excluir(obra);
		ModelAndView modelAndView =  listar(1);
		return modelAndView;
	}	
	
	
	public ArrayList<Integer> listaPaginacao(ObraDao obraDao){
		List<Obra> listaObra = obraDao.findAll();
		int numPag = listaObra.size() / 3;

		if(numPag <= 0) {
			numPag = 1;
		}

		ArrayList<Integer> listaPaginacao = new ArrayList<>();
		for(int i=0;i <= numPag;i++) {
			listaPaginacao.add(i+1); 
		}
		return  listaPaginacao;
	}

}
