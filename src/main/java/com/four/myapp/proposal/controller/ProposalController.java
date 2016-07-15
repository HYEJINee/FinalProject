package com.four.myapp.proposal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String proposalGet() {
		return "/proposal/write";
	}
}
