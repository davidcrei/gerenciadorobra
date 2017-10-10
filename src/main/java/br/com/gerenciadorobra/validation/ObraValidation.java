package br.com.gerenciadorobra.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;

import br.com.gerenciadorobra.models.Obra;

public class ObraValidation implements Validator {
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Obra.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "cnpj", "field.required");

		Obra obra = (Obra) target;
	}
}
