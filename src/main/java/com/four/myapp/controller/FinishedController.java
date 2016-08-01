package com.four.myapp.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.service.FinishedService;
import com.four.myapp.service.ReadService;

@Controller
public class FinishedController {
	@Autowired
	private FinishedService service;
	
	@RequestMapping("/finished/list")
	public void FinishedHandler(Model model) throws SQLException {
		model.addAttribute("list", service.getAll_fin());
	}
	
	@RequestMapping("/finished/tab")
	public @ResponseBody List<MainDto> TabHandler(@RequestParam("type") String type, Model model) throws SQLException {
		if(type.equals("all")) {
			return service.getAll_fin();
		}
		else if(type.equals("pro-con")) {
			return service.getProCon_fin();
		}
		else {
			return service.getFree_fin();
		}
	}
	
	@Autowired
	private ReadService read_service;
	
	@RequestMapping(value="/finished/read", method=RequestMethod.GET)
	public void readget(@RequestParam("topic_no") int topic_no, Model model, HttpSession session) throws SQLException {
		MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
		if(vo != null) {
			model.addAttribute("readuser", vo);
	      }
		model.addAttribute("readlist",read_service.Readdao(topic_no));
		model.addAttribute("readResource",read_service.getResource(topic_no));
		model.addAttribute("readOpinion",read_service.getOpinion(topic_no));
		model.addAttribute("taglist",read_service.getTaglist(topic_no));
	}
}
