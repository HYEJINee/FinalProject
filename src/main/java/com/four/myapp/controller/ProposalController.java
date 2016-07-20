package com.four.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.four.myapp.service.TopicProposalService;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {
	@Autowired
	private TopicProposalService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model) {
		model.addAttribute("topicList", service.listAll());
		return "/proposal/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeGet() {
		return "/proposal/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writePost() {
		return "home";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGet(int topic_no, Model model) {
		model.addAttribute("topic", service.callTopic(topic_no));
		model.addAttribute("ref", service.callRefs(topic_no));
		model.addAttribute("replies", service.callReplies(topic_no));
		return "/proposal/read";
	}
}
