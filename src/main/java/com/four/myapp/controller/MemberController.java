package com.four.myapp.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
	

	@RequestMapping(value = "/member_regist", method = RequestMethod.GET)
	public void member_regist() throws Exception {
	}

	@RequestMapping(value = "/member_regist", method = RequestMethod.POST)
	public String member_regist(@ModelAttribute MemberVO vo) throws SQLException {
		service.registMember(vo);
		logger.info("loginComplete : " + vo.toString());
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() throws Exception {
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginComplete(@Valid MemberVO member, BindingResult result, HttpServletRequest req) {
		logger.info("loginComplete : " + member.toString());

		if (result.hasErrors()) { // errors라는 객체에 에러가 들어가있느냐
			return "/member/login";
		}
		/*
		 * try{ MemberVO vo = service.readWithPW(member.getUserid(),
		 * member.getUserpw()); if(vo==null){ return "/member/login"; } }
		 * catch(Exception err){ return "/login"; // 로그인 실패시 login page로 다시
		 * 이동한다. }
		 */
		try {
			MemberVO vo = service.readWithPW(member.getUser_email(), member.getUser_pw());
			WebUtils.setSessionAttribute(req, "USER_KEY", vo);
		} catch (Exception err) {
			return "/member/login";
		}
		return "home";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();

		return "home";
	}

}
