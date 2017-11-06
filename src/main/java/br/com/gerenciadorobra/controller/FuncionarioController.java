package br.com.gerenciadorobra.controller;

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
import br.com.gerenciadorobra.models.Funcionario;
import br.com.gerenciadorobra.validation.FuncionarioValidation;

@RequestMapping("/funcionario")
@Controller
public class FuncionarioController {
	@Autowired
	private FuncionarioDao funcionarioDao;
	
	 @InitBinder
	    public void InitBinder(WebDataBinder binder) {
	            binder.addValidators(new FuncionarioValidation());
	    }
	 
	 @RequestMapping(value="/init", method=RequestMethod.GET)
		public ModelAndView init(Funcionario funcionario) {
			ModelAndView modelAndView =  new ModelAndView("cadastro/funcionario");
			modelAndView.addObject("funcionario", funcionario);
			return modelAndView;
		}
	 
	 @RequestMapping(value="/gravar", method=RequestMethod.POST)
		public ModelAndView gravar(@Valid Funcionario funcionario, BindingResult result) {
			
		 ModelAndView modelAndView =  new ModelAndView("cadastro/funcionario");
			modelAndView.addObject("funcionario", funcionario);
			
			if(result.hasErrors()) {
				return modelAndView;
			}
			funcionarioDao.gravar(funcionario);
			
			return modelAndView;
			
		}
	 
	
	 
}
