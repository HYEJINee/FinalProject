package com.four.myapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.myapp.service.MainServiceImpl;
import com.four.myapp.service.SearchService;
import com.four.myapp.service.SearchServiceImpl;

@Controller

@RequestMapping("/search/*")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	SearchServiceImpl service;

	@RequestMapping(value = "/search_result", method = RequestMethod.POST)
	public String getSearchResult(String search_word, Model model) throws Exception {
		System.out.println(search_word);
		model.addAttribute("searchList", service.getSearchResult(search_word));

		System.out.println(search_word);
		return "/search/search_result";
	}

}