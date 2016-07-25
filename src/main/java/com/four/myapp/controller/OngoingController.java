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
public class OngoingController {
	@Autowired
	private OngoingService service;
	
	@RequestMapping("/ongoing/list")
	public void OngoingHandler(Model model) throws SQLException {
		model.addAttribute("list", service.getAll_on());
	}
	
	@RequestMapping("/ongoing/tab")
	public @ResponseBody List<MainDto> TabHandler(@RequestParam("type") String type, Model model) throws SQLException {
		if(type.equals("all")) {
			return service.getAll_on();
		}
		else if(type.equals("pro-con")) {
			return service.getProCon_on();
		}
		else {
			return service.getFree_on();
		}
	}
}
