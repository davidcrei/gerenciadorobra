package br.com.gerenciadorobra.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.gerenciadorobra.models.Funcionario;

@RequestMapping("/transferencia")
@Controller
public class TransferenciaController {

	 @RequestMapping(value="/init", method=RequestMethod.GET)
		public ModelAndView init() {
			ModelAndView modelAndView =  new ModelAndView("gerencia/transferencia");
			//modelAndView.addObject("funcionario", funcionario);
			return modelAndView;
		}
	 
	 @RequestMapping(value="/gravar", method=RequestMethod.POST)
		public ModelAndView gravar(@Valid Funcionario funcionario, BindingResult result) {
			
		 ModelAndView modelAndView =  new ModelAndView("gerencia/transferencia");
			modelAndView.addObject("funcionario", funcionario);
			
			if(result.hasErrors()) {
				return modelAndView;
			}
			//funcionarioDao.gravar(funcionario);
			
			return modelAndView;
			
		}
	 
	
}
