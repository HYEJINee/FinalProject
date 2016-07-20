package com.four.myapp.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.EmailVO;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.persistence.EmailSender;
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

	@RequestMapping(value = "/login")
	public void login() {
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginComplete(MemberVO member, HttpServletRequest req) {
		logger.info("loginComplete:" + member.toString());

		try {
			MemberVO vo = service.readWithPW(member.getUser_email(), member.getUser_pw());
			if (vo.getUser_check().equals("N")) {
				return "member/needCheck";
			}
			WebUtils.setSessionAttribute(req, "USER_KEY", vo);

		} catch (Exception err) {
			logger.info("loginComplete:" + err.toString());
			return "/member/login";
		}
		return "/member/mypage";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		return "home";
	}

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberValidation());
	}

	@RequestMapping("/member/chkUser_email")
	@ResponseBody
	public Map<String, String> chkUser_email(String user_email) throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		int resultCnt = service.chkUser_email(user_email);
		System.out.println(user_email);
		System.out.println(resultCnt);
		String result = "";
		String resultMsg = "";
		if (resultCnt == 0) {
			result = "success";
			resultMsg = "사용가능한 아이디입니다.";
		} else {
			result = "fail";
			resultMsg = "이미 사용중인 아이디입니다.";
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	@RequestMapping("/member/chkUser_nick")
	@ResponseBody
	public Map<String, String> chkUser_nick(String user_nick) throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		int resultCnt = service.chkUser_email(user_nick);
		System.out.println(user_nick);
		System.out.println(resultCnt);
		String result = "";
		String resultMsg = "";
		if (resultCnt == 0) {
			result = "success";
			resultMsg = "사용가능한 닉네임입니다.";
		} else {
			result = "fail";
			resultMsg = "이미 사용중인 닉네임입니다.";
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	@RequestMapping(value = "/member_findPw")
	public void member_findPw() {

	}

	@Autowired
	private EmailSender emailSender;
	@Autowired
	private EmailVO email;

	@RequestMapping(value = "/member_findPw", method = RequestMethod.POST)
	public ModelAndView findPw(MemberVO mem, String user_email, String user_nick, ModelMap model) throws Exception {
		ModelAndView mav;
		System.out.println(user_email + "," + user_nick);
		MemberVO vo = service.findPw(user_email, user_nick);
		System.out.println(mem.getUser_email());
		String find_email = vo.getUser_email();
		String find_nick = vo.getUser_nick();
		String find_pw = vo.getUser_pw();
		System.out.println(find_pw);
		if (find_pw != null) {
			email.setContent(find_nick + "님의 비밀번호는 " + find_pw + " 입니다. 안전한 개인 정보 보호를 위해 로그인 하신 후 비밀번호를 바꿔주세요.");
			email.setReceiver(find_email);
			email.setSubject(find_nick + "님, Tawar 비밀번호 찾기 메일입니다.");
			System.out.println(find_email + "," + find_nick + "," + find_pw);
			emailSender.SendEmail(email);
			System.out.println("controller : " + email);
			mav = new ModelAndView("redirect:/login");
			return mav;
		} else {
			mav = new ModelAndView("redirect:/logout");
			return mav;
		}
	}

}
