package com.four.myapp.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.four.myapp.domain.MainDto;
import com.four.myapp.service.OngoingService;

@Controller
@RequestMapping("/ongoing/*")
public class OngoingController {
	@Autowired
	private OngoingService service;
	
	@RequestMapping("/list")
	public void OngoingHandler(@RequestParam(required=false) Integer pageNo, Model model) throws SQLException {
		if(pageNo == null)
			  pageNo = 1;
		int index = (pageNo-1) * 9;
		
		model.addAttribute("list", service.getAll_on(index));
	}
	
	@RequestMapping("/ongoing/tab")
	public @ResponseBody List<MainDto> TabHandler(@RequestParam(required=false) Integer pageNo, @RequestParam("type") String type, Model model) throws SQLException {
		int index = 0;
		if(pageNo == null)
			  pageNo = 1;
		index = (pageNo-1) * 9;
		
		if(type.equals("all")) {
			return service.getAll_on(index);
		}
		else if(type.equals("pro-con")) {
			return service.getProCon_on(index);
		}
		else {
			return service.getFree_on(index);
		}
	}
}
