package com.four.myapp.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.service.MypageServiceImpl;


@Controller
@RequestMapping("/member/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Inject
	MypageServiceImpl service;
	
	@RequestMapping(value = "/mypage", method=RequestMethod.GET)
	public String timeline(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("USER_KEY");
		if (vo == null) {
			return "/member/login";
		}
		else {
			String user_no = vo.getUser_no();
			model.addAttribute("timeline", service.timeline(user_no));
			model.addAttribute("getNoti", service.getNoti(user_no));
			model.addAttribute("getMyList", service.getMyList(user_no));
			return "/member/mypage";
		}
	}
	
	@RequestMapping(value="/dismissNoti", method=RequestMethod.POST )
	public void dismissNoti(String noti_no) throws SQLException {
		service.dismissNoti(noti_no);
		
	}
	
}
