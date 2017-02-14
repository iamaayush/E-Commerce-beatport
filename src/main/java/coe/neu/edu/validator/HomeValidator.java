package coe.neu.edu.validator;


import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import coe.neu.edu.model.UserAccount;

public class HomeValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return UserAccount.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UserAccount userAccount = (UserAccount)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "validate.username", "Your Name Is Incorrect");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "validate.password", "Your password Is Incorrect");
	}
}