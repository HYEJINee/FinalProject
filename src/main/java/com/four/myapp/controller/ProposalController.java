package com.four.myapp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.service.TopicProposalService;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {
   @Autowired
   private TopicProposalService service;
   
   private final static Logger logger = LoggerFactory.getLogger(ProposalController.class);
   
   @RequestMapping(value="/list", method=RequestMethod.GET)
   public String listGet(@RequestParam(required=false) Integer pageNo, Model model) {
	  if(pageNo == null) { pageNo = 1; }
	  model.addAttribute("topicList", service.listAll(pageNo));
	  return "/proposal/list";
   }
   
   @RequestMapping(value="/write.do", method=RequestMethod.GET)
   public String writeGet() {
      return "/proposal/write";
   }
   
   @RequestMapping(value="/write.do", method=RequestMethod.POST)
   public String writePost(@RequestParam(value="topic_resource_title") List<String> refTitles, @RequestParam(value="topic_resource_link") List<String> refLinks, @RequestParam(value="image_file_name") MultipartFile multipartFile, TopicProposalDTO topicProposalDTO, HttpServletRequest req)  throws Exception, IOException {
	  MemberVO vo = (MemberVO)req.getSession().getAttribute("USER_KEY");
	  String filePath = req.getServletContext().getRealPath("/") + "resources/proposal/img/";
	  
	  if(vo != null) {
		  service.submitProposal(vo, multipartFile, filePath, topicProposalDTO, refTitles, refLinks);
	  }
	  return "redirect:/proposal/list";
   }
   
   @RequestMapping(value="/read", method=RequestMethod.GET)
   public String readGet(@RequestParam(required=false) Integer pageNo, int topic_no, Model model, HttpSession session) {
      MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
      if(vo != null) {
         int user_no = Integer.parseInt(vo.getUser_no());
         model.addAttribute("voted", service.recommendedHistory(topic_no, user_no));
      }
      if(pageNo == null) { pageNo = 1; }
      logger.info("pageNo : " + pageNo);
      
      model.addAttribute("topic", service.callTopic(topic_no));
      model.addAttribute("ref", service.callRefs(topic_no));
      model.addAttribute("replies", service.callReplies(topic_no, pageNo));
      return "/proposal/read";
   }
   
   @RequestMapping(value="/read.vote", method=RequestMethod.POST)
   public String vote(int topic_no, int recommend, HttpSession session) {
      if(recommend + 1 >= 20) {
    	  service.proposalToGo(topic_no);
    	  return "redirect:/ongoing/list";
      }

      MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
      service.voteProposal(vo, topic_no);
   	  return "redirect:/proposal/read?topic_no=" + topic_no;
   }
   
   @RequestMapping(value="/read.reply", method=RequestMethod.POST)
   public String commentPost(ReplyDTO replyDTO, HttpSession session) {
	   MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
	   service.commentUp(vo, replyDTO);
	   return "redirect:/proposal/read?topic_no=" + replyDTO.getTopic_no() + "#bottom";
   }
   
   @RequestMapping(value="/reply.update", method=RequestMethod.POST)
   public String commentMod(ReplyDTO replyDTO, HttpSession session) {
	   service.modReply(replyDTO);
	   return "redirect:/proposal/read?topic_no=" + replyDTO.getTopic_no() + "#reply" + replyDTO.getReply_no();
   }

   @RequestMapping(value="/reply.delete", method=RequestMethod.POST)
   public String commentDel(int topic_no, int reply_no, HttpSession session) {
	   service.delReply(reply_no);
	   return "redirect:/proposal/read?topic_no=" + topic_no;
   }
}
