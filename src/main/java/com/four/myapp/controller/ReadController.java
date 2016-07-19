package com.four.myapp.controller;


import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void readget(Model model) throws SQLException {
		model.addAttribute("readlist",service.Readdao());
	}
	
}
