package br.com.gerenciadorobra.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView listar() {
		Obra obra = new Obra();
		//obra.setNome("G2O");
		ModelAndView modelAndView =  new ModelAndView("cadastro/obra");
		modelAndView.addObject("obra", obra);
		int pagina = 1;
		List<Obra> obras  = obraDao.findListaPaginada(pagina);
		
		modelAndView.addObject("obras", obras);
		return modelAndView;
	}
	
	
	@RequestMapping(value="/gravar", method=RequestMethod.POST)
	public ModelAndView gravar(Obra obra) {
		obra.setId(null);
		obraDao.gravar(obra);
		ModelAndView modelAndView =  new ModelAndView("cadastro/obra");
		
		List<Obra> obras  = obraDao.findAll();
		
		modelAndView.addObject("obras", obras);
		modelAndView.addObject("obra",new Obra());
		return modelAndView;
	}
	

}
