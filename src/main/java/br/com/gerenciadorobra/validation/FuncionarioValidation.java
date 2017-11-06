package br.com.gerenciadorobra.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.gerenciadorobra.models.Funcionario;

public class FuncionarioValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Funcionario.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "cpf", "field.required");

		Funcionario funcionario = (Funcionario) target;
	}
}
