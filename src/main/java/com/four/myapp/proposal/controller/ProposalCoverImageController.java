package com.four.myapp.proposal.controller;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.four.myapp.proposal.domain.CoverImageDto;

@Controller
@RequestMapping("/proposal/*")
public class ProposalCoverImageController {
	private Logger logger = LoggerFactory.getLogger(ProposalCoverImageController.class);
	
	@RequestMapping(value="/write.cover", method=RequestMethod.POST)
	public ModelAndView coverImgUp(CoverImageDto coverImageDto, HttpServletRequest req) {
		logger.info("coverImgUp called");
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				logger.info("path : " + req.getContextPath());
				logger.info("name : " + multipartFile.getName());
				logger.info("filename : " + multipartFile.getOriginalFilename());
				logger.info("size : " + multipartFile.getSize());
			}
		}
		ModelAndView mv = new ModelAndView("redirect:/proposal/write.do");
		return mv;
	}
}
