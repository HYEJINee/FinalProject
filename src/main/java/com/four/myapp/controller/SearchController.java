package com.four.myapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.four.myapp.service.BoardServiceImpl;

@Controller
@RequestMapping("/member/*")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	BoardServiceImpl service;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@ModelAttribute String search_word, Model model) throws Exception {
	
		return "redirect:/member/search_view";
	}

}