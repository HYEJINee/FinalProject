package com.four.myapp.controller;


import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.service.ReadService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/read/*")
public class ReadController {
	@Autowired
	private ReadService service;
	@RequestMapping(value="read", method=RequestMethod.GET)
	public void readget(@RequestParam("topic_no") int topic_no, Model model, HttpSession session) throws SQLException {
		MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
		if(vo != null) {
			model.addAttribute("readuser", vo);
	      }
		model.addAttribute("readlist",service.Readdao(topic_no));
		model.addAttribute("readResource",service.getResource(topic_no));
		model.addAttribute("readOpinion",service.getOpinion(topic_no));
	}
	
}
