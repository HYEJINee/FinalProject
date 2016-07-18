package com.four.myapp.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.service.MemberServiceImpl;
import com.four.myapp.util.MemberValidation;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberServiceImpl service;
	@RequestMapping(value = "/member_regist", method = RequestMethod.GET)
	public void member_regist() throws Exception {
	}

	@RequestMapping(value = "/member_regist", method = RequestMethod.POST)
	public String member_regist(@ModelAttribute MemberVO vo) throws SQLException {
		service.registMember(vo);
		logger.info("loginComplete : " + vo.toString());
		return "home";
	}

	@RequestMapping(value="/login")
	public void login() {
		//�깮�왂
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginComplete(@Valid MemberVO member, BindingResult result, HttpServletRequest req) {
		logger.info("loginComplete:" + member.toString());
		if(result.hasErrors()){
			return "/member/login";
		}
		
		try{
			MemberVO vo = service.readWithPW(member.getUser_email(), member.getUser_pw());
			WebUtils.setSessionAttribute(req, "USER_KEY", vo);
		}
		catch(Exception err) {
			logger.info("loginComplete:" + err.toString());
			return "/member/login";
		}
		return "/member/mypage";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest req){
		req.getSession().invalidate(); 
		return "home";
	}
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(new MemberValidation());
	}
}




