package com.four.myapp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
		StringTokenizer st = new StringTokenizer(search_word, " ");
		String[] keyWords = new String[st.countTokens()];

		int i = 0;
		String search = "";
		String search2 = "";
		while (st.hasMoreTokens()) {

			keyWords[i] = st.nextToken().trim();
			i++;
		}
		if (keyWords.length == 0) {
			search2 = "like '%%'";
		} else {
			for (i = 0; i < keyWords.length; i++) {
				if (keyWords.length == 1) {
					search += "like '%" + keyWords[i] + "%'";
					search2 += "like '%" + keyWords[i] + "%'";
				} else {
					if (i == 0) {
						search += " like '%" + keyWords[i] + "%'" + "and ";
						search2 += "like '%" + keyWords[i] + "%'" + "and ";
					} else if (i < keyWords.length - 1) {
						search += "topic_title like '%" + keyWords[i] + "%'" + "and ";
						search2 += "topic_short_cont like '%" + keyWords[i] + "%'" + "and ";
					} else {
						search += "topic_title like '%" + keyWords[i] + "%' ";
						search2 += "topic_short_cont like '%" + keyWords[i] + "%' ";
					}
				}
			}
		}
		System.out.println("select topic_tbl.topic_no, topic_tbl.user_no, topic_type, topic_title, topic_short_cont, topic_progress, debate_tot_pro, debate_tot_con, debate_tot_neut, op_cnt from topic_tbl left join debate_tbl on topic_tbl.topic_no = debate_tbl.topic_no left join (select count(op_no) as op_cnt, topic_no from opinion_tbl) as op_tbl on topic_tbl.topic_no = op_tbl.topic_no where topic_title " + search+ "or topic_short_cont " + search2);
		model.addAttribute("searchList", service.getSearchResult(search, search2));

		return "/search/search_result";
	}
}