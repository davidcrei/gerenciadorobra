package br.com.gerenciadorobra.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.BindingResultUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.InitBinder;
import br.com.gerenciadorobra.daos.ObraDao;
import br.com.gerenciadorobra.models.Obra;
import br.com.gerenciadorobra.validation.ObraValidation;

@RequestMapping("/cadastro")
@Controller
public class ObraController {
 public static final int qtdRegistros = 10;
	@Autowired
	private ObraDao obraDao;

    @InitBinder
    public void InitBinder(WebDataBinder binder) {
            binder.addValidators(new ObraValidation());
    }
	
	@RequestMapping(value="/listar", method=RequestMethod.GET)
	public ModelAndView listar(Obra obra,Integer paginaAtual) {
		

		if(paginaAtual == null) {
			paginaAtual = 1;
		}

		ArrayList<Integer> paginacao = listaPaginacao(); 
		List<Obra> obras  = obraDao.findListaPaginada(paginaAtual);

		ModelAndView modelAndView =  new ModelAndView("cadastro/obra");
		modelAndView.addObject("obra", obra);
		modelAndView.addObject("listaPaginacao", paginacao);
		modelAndView.addObject("obras", obras);

		return modelAndView;
	}
	


	@RequestMapping(value="/gravar", method=RequestMethod.POST)
	public ModelAndView gravar(@Valid Obra obra, BindingResult result) {
		ModelAndView modelAndView = listar(obra,null);
		if(result.hasErrors()) {
			return modelAndView;
		}
		obraDao.gravar(obra);
		
		modelAndView = listar( obra= new Obra(),null);
		return modelAndView;
		
	}

		
	@RequestMapping(value="/atualizar", method=RequestMethod.GET)
	public ModelAndView atualizar(@Valid Obra obra, BindingResult result) {
		ModelAndView modelAndView = listar(obra,null);
		
		if(result.hasErrors()) {
			return modelAndView;
		}
		
		obraDao.atualizar(obra);
		return modelAndView;
	}	
	
	
	@RequestMapping(value="/excluir/{id}", method=RequestMethod.GET)
	public ModelAndView excluir(@PathVariable("id") Integer id) {
		Obra obra = obraDao.buscaPorChavePrimaria(id);
		obraDao.excluir(obra);
		ModelAndView modelAndView =  listar(obra,null);
		return modelAndView;
	}	
	
	
	public ArrayList<Integer> listaPaginacao(){
		List<Obra> listaObra = obraDao.findAll();
		int numPag = listaObra.size() / qtdRegistros;
        int resto = listaObra.size() % qtdRegistros;
		        
        if(numPag <= 0) {
        	numPag = 1;
        }
       
        if(resto > 0 && (listaObra.size() > qtdRegistros)) {
    		numPag += 1;
    	}
        
        
		ArrayList<Integer> listaPaginacao = new ArrayList<>();
		for(int i=0;i < numPag;i++) {
			listaPaginacao.add(i+1); 
		}
		return  listaPaginacao;
	}

}
