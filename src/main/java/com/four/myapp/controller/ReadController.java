package com.four.myapp.controller;


import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.service.ReadService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReadController {
	@Autowired
	private ReadService service;

	
	private static final Logger logger = LoggerFactory.getLogger(ReadController.class);
	
	@RequestMapping(value="/read/read", method=RequestMethod.GET)
	public void readget(@RequestParam("topic_no") int topic_no, Model model, HttpSession session) throws SQLException {
		MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
		if(vo != null) {
			model.addAttribute("readuser", vo);
			 int user_no = Integer.parseInt(vo.getUser_no());
			 model.addAttribute("readvote",service.Readvote(topic_no, user_no));
			 model.addAttribute("readoplike",service.getoplike(user_no));
	      }
		model.addAttribute("readlist",service.Readdao(topic_no));
		model.addAttribute("readResource",service.getResource(topic_no));
		model.addAttribute("readOpinion",service.getOpinion(topic_no));
	}
	
	 @RequestMapping(value="/read/vote", method=RequestMethod.POST)
	   public String vote(@RequestParam("vote_type")int vote_type, int topic_no, HttpSession session){
		 
		 logger.info("글번호 : " + topic_no);
		 logger.info("투표 타입 : " + vote_type);
	     MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
	     int user_no = Integer.parseInt(vo.getUser_no());
	     logger.info("유저 번호 : " + user_no);
	     service.topicvote(topic_no, user_no,vote_type);
	     
	     if(vote_type == 0){
	    	 service.votepro(topic_no);
	     } else if(vote_type == 1){
	    	 service.votecon(topic_no);
	     } else{
	    	 service.voteneut(topic_no);
	     }
	     
	     return "redirect:/read/read?topic_no="+topic_no;
	   }
	 
	 @RequestMapping(value="/read/like", method=RequestMethod.POST)
	   public String like(@RequestParam("op_like_type")int op_like_type, int topic_no,int op_no, HttpSession session){
		 
		 logger.info("의견 번호 : " + op_no);
		 logger.info("투표 타입 : " + op_like_type);
	     MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
	     int user_no = Integer.parseInt(vo.getUser_no());
	     logger.info("유저 번호 : " + user_no);
	     logger.info("토론 번호 : " + topic_no);
	     
	     service.likevote(op_no, user_no, op_like_type);
	     
	     return "redirect:/read/read?topic_no="+topic_no;
	   }
}
