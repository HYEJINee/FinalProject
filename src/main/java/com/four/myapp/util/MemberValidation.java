package com.four.myapp.util;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.persistence.MemberDAO;


public class MemberValidation implements Validator{
	@Inject
	private MemberDAO dao;
	
	@Override
	public boolean supports(Class<?> arg0) {
		return MemberVO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		MemberVO member = (MemberVO) arg0;
		if(member.getUser_email() == null || member.getUser_email().trim().isEmpty()){
			arg1.rejectValue("user_email", "required");
		}
		if(member.getUser_pw() == null || member.getUser_pw().trim().isEmpty()){
			arg1.rejectValue("user_pw", "required");
		}
	}
	

}
