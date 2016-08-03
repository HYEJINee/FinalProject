package com.four.myapp.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.service.MemberServiceImpl;
import com.four.myapp.service.MypageServiceImpl;
import com.four.myapp.util.CoverImgValidation;


@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Inject
	MypageServiceImpl service;
	
	@Inject
	MemberServiceImpl memService;
	
	@RequestMapping(value = "/mypage", method=RequestMethod.GET)
	public String timeline(HttpServletRequest request, Model model, @RequestParam(required=false) Integer pageNo) throws Exception {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("USER_KEY");
		if (vo == null) {
			return "/member/login";
		}
		else {
			String user_no = vo.getUser_no();
			
			if(pageNo == null)
				  pageNo = 1;
			int index = (pageNo-1) * 9;
			
			model.addAttribute("getMyList", service.getMyList(user_no, index));
			
			model.addAttribute("timeline", service.timeline(user_no));
			model.addAttribute("getNoti", service.getNoti(user_no));
			/*
			model.addAttribute("getMyList", service.getMyList(user_no));
			model.addAttribute("getMyRecmdList", service.getMyRecmdList(user_no));
			model.addAttribute("getMyFinishList", service.getMyFinishList(user_no));
			*/
			return "/mypage/mypage_home";
		}
	}
	
	@RequestMapping(value="/dismissNoti", method=RequestMethod.POST )
	public void dismissNoti(String noti_no) throws SQLException {
		service.dismissNoti(noti_no);
	}
	
	 @RequestMapping(value="/uploadProfile", method=RequestMethod.POST)
	   public String uploadProfile(@RequestParam(value="image_file_name") MultipartFile multipartFile, MemberVO memberVO, HttpSession session, HttpServletRequest req)  throws Exception, IOException {
		 
		 MemberVO vo = (MemberVO)session.getAttribute("USER_KEY");
		 System.out.println(vo.getProfile_file_name()); //파일이름
		  if(vo != null) {
			   String user_no = vo.getUser_no();
			   memberVO.setUser_no(user_no);
			   if(multipartFile.isEmpty() == false) {
				   String ori_fileName = multipartFile.getOriginalFilename();
				   System.out.println("after ori filename");
				   String ex = ori_fileName.substring(ori_fileName.lastIndexOf(".") + 1);
				   
				   boolean typeValidation = CoverImgValidation.imageValidator(multipartFile.getBytes());
				   
				   if(typeValidation) {
					   String fileName = vo.getUser_nick() + "_" +(System.currentTimeMillis()/1000);
					   File file = new File(req.getServletContext().getRealPath("/") + "resources/mypage/img/" + fileName + "." + ex);
					   String user_profile = file.getName().toString();
					   multipartFile.transferTo(file);
					   memberVO.setProfile_file_name(fileName);
					   memberVO.setProfile_ext_name(ex);
					   memberVO.setUser_profile(user_profile);
				   } else {
					   return "redirect:/mypage/mypage";
				   }
			   }
		  }
		  service.uploadProfile(memberVO);
		  vo = memService.selectMember(vo.getUser_email());
		   WebUtils.setSessionAttribute(req, "USER_KEY", vo);
	      return "redirect:/mypage/mypage";
	   }

}
