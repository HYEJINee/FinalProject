package com.four.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.service.TopicProposalService;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {
	@Autowired
	@Qualifier("topicService")
	private TopicProposalService topicProposalService;
	
	private final static Logger logger = LoggerFactory.getLogger(ProposalController.class);
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model) {
		model.addAttribute("topicList", topicProposalService.listAll());
		return "/proposal/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String writeGet() {
		return "/proposal/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writePost(TopicProposalDTO topicProposalDTO, HttpServletRequest req) {
		logger.info("user_no : " + topicProposalDTO.getUser_no());
		logger.info("topic_type : " + topicProposalDTO.getTopic_type());
		logger.info("topic_title : " + topicProposalDTO.getTopic_title());
		return "redirect:/proposal/list";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGet(int topic_no, Model model) {
		model.addAttribute("topic", topicProposalService.callTopic(topic_no));
		model.addAttribute("ref", topicProposalService.callRefs(topic_no));
		model.addAttribute("replies", topicProposalService.callReplies(topic_no));
		return "/proposal/read";
	}
}
