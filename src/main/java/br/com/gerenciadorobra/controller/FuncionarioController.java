package br.com.gerenciadorobra.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.gerenciadorobra.daos.FuncionarioDao;
import br.com.gerenciadorobra.daos.ObraDao;
import br.com.gerenciadorobra.models.Funcionario;
import br.com.gerenciadorobra.models.Obra;
import br.com.gerenciadorobra.validation.FuncionarioValidation;

@RequestMapping("/funcionario")
@Controller
public class FuncionarioController {
	@Autowired
	private FuncionarioDao funcionarioDao;
	@Autowired
	private ObraDao obraDao;
	
	   @InitBinder
	    public void InitBinder(WebDataBinder binder) {
	            binder.addValidators(new FuncionarioValidation());
	    }
	 
	 @RequestMapping(value="/inicio", method=RequestMethod.GET)
		public ModelAndView inicio(Funcionario funcionario) {
		 
		    List<Obra> obras  = obraDao.findAll();  
			ModelAndView modelAndView =  new ModelAndView("cadastro/funcionario");
			modelAndView.addObject("funcionario", funcionario);
			modelAndView.addObject("obras", obras);
			
			
			return modelAndView;
		}
	 
	 @RequestMapping(value="/gravar", method=RequestMethod.POST)
		public ModelAndView gravar(@Valid Funcionario funcionario, BindingResult result) {
			
		 ModelAndView modelAndView =  new ModelAndView("cadastro/funcionario");
			modelAndView.addObject("funcionario", funcionario);
			if(result.hasErrors()) {
				return modelAndView;
			}
			
			//funcionario.setObra(obra);
			funcionarioDao.gravar(funcionario);
			return modelAndView = inicio(funcionario);
			
		}
	 
	
	 
}
