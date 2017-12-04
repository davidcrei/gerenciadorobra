package br.com.gerenciadorobra.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.gerenciadorobra.daos.FuncionarioDao;
import br.com.gerenciadorobra.daos.ObraDao;
import br.com.gerenciadorobra.models.Funcionario;
import br.com.gerenciadorobra.models.Obra;

@RequestMapping("/transferencia")
@Controller
public class TransferenciaController {
	@Autowired
	private ObraDao obraDao;
	@Autowired
	private FuncionarioDao funcionarioDao;

	@RequestMapping(value="/init", method=RequestMethod.GET)
	public ModelAndView init(Funcionario funcionario,Obra obra) {

		List<Obra> obras  = obraDao.findAll();
		List<Funcionario> funcionarios = funcionarioDao.listaFuncionario();
		
		ModelAndView modelAndView =  new ModelAndView("gerencia/transferencia");
		modelAndView.addObject("funcionario", funcionario);
		modelAndView.addObject("obra", obra);
		modelAndView.addObject("obras", obras);
		modelAndView.addObject("funcionarios", funcionarios);


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
