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
@RequestMapping("/finished/*")
public class FinishedController {
	@Autowired
	private FinishedService service;
	
	@RequestMapping("/list")
	public void FinishedHandler(@RequestParam(required=false) Integer pageNo, Model model) throws SQLException {
		if(pageNo == null)
			  pageNo = 1;
		int index = (pageNo-1) * 9;
		
		model.addAttribute("list", service.getAll_fin(index));
	}
	
	@RequestMapping("/tab")
	public @ResponseBody List<MainDto> TabHandler(@RequestParam("pageNo") Integer pageNo, @RequestParam("type") String type, Model model) throws SQLException {
		int index = 0;
		if(pageNo == null)
			  pageNo = 1;
		index = (pageNo-1) * 9;
		
		if(type.equals("all"))
			return service.getAll_fin(index);
		else if(type.equals("pro-con"))
			return service.getProCon_fin(index);
		else
			return service.getFree_fin(index);
	}
	
	@Autowired
	private ReadService read_service;
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void readget(@RequestParam("topic_no") int topic_no, Model model, HttpSession session) throws SQLException {
		MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
		if(vo != null) {
			model.addAttribute("readuser", vo);
	      }
		model.addAttribute("readlist",read_service.Readdao(topic_no));
		model.addAttribute("readResource",read_service.getResource(topic_no));
		model.addAttribute("readOpinion",read_service.getOpinion(topic_no));
	}
}
