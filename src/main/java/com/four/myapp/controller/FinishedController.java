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
import com.four.myapp.service.FinishedService;

@Controller
public class FinishedController {
	@Autowired
	private FinishedService service;
	
	@RequestMapping("/finished/tab")
	public @ResponseBody List<MainDto> FinishedTabHandler(@RequestParam("type") String type, Model model) throws SQLException {
		if(type.equals("all")) {
			return service.getAll();
		}
		else if(type.equals("pro-con")) {
			return service.getProCon();
		}
		else {
			return service.getFree();
		}
	}
}
