package com.four.myapp.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
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
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.service.TopicProposalService;
import com.four.myapp.util.CoverImgValidation;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {
   @Autowired
   private TopicProposalService service;
   
   private final static Logger logger = LoggerFactory.getLogger(ProposalController.class);
   
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
   public String writePost(@RequestParam(value="topic_resource_title") List<String> refTitles, @RequestParam(value="topic_resource_link") List<String> refLinks, TopicProposalDTO topicProposalDTO, HttpSession session) {
	  MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
	  if(vo != null) {
		   int user_no = Integer.parseInt(vo.getUser_no());
		   topicProposalDTO.setUser_no(user_no);
	  }
	  service.submitProposal(topicProposalDTO, refTitles, refLinks);
      return "redirect:/proposal/list";
   }
   
   @RequestMapping(value="/write.cover", method=RequestMethod.POST)
   public void coverImgUp(@RequestParam(value="img_file_name") MultipartFile multipartFile, HttpSession session, HttpServletRequest request) throws Exception, IOException {
	   if(multipartFile != null) {
		   MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
		   String ori_fileName = multipartFile.getOriginalFilename();
		   String ex = ori_fileName.substring(ori_fileName.length()-3);
		   
		   boolean typeValidation = CoverImgValidation.imageValidator(multipartFile.getBytes());
		   
		   if(typeValidation == true) {
			   String fileName = vo.getUser_nick() + "_" + (System.currentTimeMillis()/1000) + ".";
			   File file = new File(request.getServletContext().getRealPath("/") + "resources/proposal/img/" + fileName + ex);
			   multipartFile.transferTo(file);
			   BufferedImage bi = ImageIO.read(file);
			   
			   request.setAttribute("imgValidate", true);
			   request.setAttribute("imgPath", "/resources/proposal/img/" + fileName + ex);
			   request.setAttribute("imgName", fileName);
			   request.setAttribute("extension", ex);
			   request.setAttribute("imgHeight", bi.getHeight());
			   request.setAttribute("imgWidth", bi.getWidth());
		   } else {
			   request.setAttribute("imgValidate", false);
		   }
	   }
   }
   
   @RequestMapping(value="/read", method=RequestMethod.GET)
   public String readGet(int topic_no, Model model, HttpSession session) {
      MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
      if(vo != null) {
         int user_no = Integer.parseInt(vo.getUser_no());
         model.addAttribute("voted", service.recommendedHistory(topic_no, user_no));
      }
      model.addAttribute("topic", service.callTopic(topic_no));
      model.addAttribute("ref", service.callRefs(topic_no));
      model.addAttribute("replies", service.callReplies(topic_no));
      return "/proposal/read";
   }
   
   @RequestMapping(value="/read.vote", method=RequestMethod.POST)
   public String vote(int topic_no, HttpSession session) {
      MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
      int user_no = Integer.parseInt(vo.getUser_no());
      service.voteProposal(topic_no, user_no);
      return "redirect:/proposal/read?topic_no="+topic_no;
   }
}
