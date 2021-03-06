package com.four.myapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.EmailVO;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.persistence.EmailSender;
import com.four.myapp.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
    @Autowired
      private EmailSender emailSender;
      @Autowired
      private EmailVO email;
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   @Inject
   MemberServiceImpl service;
   
   @RequestMapping(value = "/member_regist", method = RequestMethod.GET)
   public void member_regist() throws Exception {
   }


   @RequestMapping(value = "/member_regist", method = RequestMethod.POST)
   public String member_regist(@ModelAttribute MemberVO vo,Model model) throws Exception {
      service.registMember(vo);
      String link = "http://gowls2nj.cafe24.com/member/member_check?user_check=Y&&user_email="+vo.getUser_email();
               email.setContent(vo.getUser_nick()+"님, 다음 링크를 클릭하여 인증을 완료해주세요.\n" + link);
               email.setReceiver(vo.getUser_email());
               email.setSubject(vo.getUser_nick()+"님, Tawar 인증 메일입니다.");
               emailSender.SendEmail(email);
               System.out.println("controller : "+email);
          
      logger.info("loginComplete : " + vo.toString());
      return "/member/needCheck";
   }
   @RequestMapping(value="/member_check")
   public void member_check(String user_check,String user_email) {
      if(user_check.equals("Y")){
         service.member_check(user_check, user_email);
         
      }
      
   }
   @RequestMapping(value="/member_login")
   public void member_login() {
   }

   @RequestMapping(value="/member_login", method=RequestMethod.POST)
   public String member_login(MemberVO member, HttpServletRequest req) {
      logger.info("loginComplete:" + member.toString());
   
      
      try{
         MemberVO vo = service.readWithPW(member.getUser_email(), member.getUser_pw());
         if(vo.getUser_check().equals("N")){
            return "member/needCheck";
         }
         WebUtils.setSessionAttribute(req, "USER_KEY", vo);
         
      }
      catch(Exception err) {
         logger.info("loginComplete:" + err.toString());
         return "/member/login_fail";
      }
      return "redirect:/";
   }
   @RequestMapping(value="/member_beforeModify")
   public void member_beforeModify() {
   }

   @RequestMapping(value="/member_beforeModify", method=RequestMethod.POST)
   public String member_beforeModify(MemberVO member, HttpServletRequest req) throws Exception {

      try{
      MemberVO vo = (MemberVO) WebUtils.getSessionAttribute(req, "USER_KEY");
      logger.info("before :" + member.toString());
      service.readWithPW(vo.getUser_email(),member.getUser_pw());
      vo = service.selectMember(vo.getUser_email());
      WebUtils.setSessionAttribute(req, "USER_KEY", vo);
      System.out.println(vo.toString());
      }
      catch(Exception err){
         logger.info("beforeModifyFail:"+err.toString());
         return "/member/beforeModify_fail";
      }
      return "redirect:/member/member_modify";
   }
   @RequestMapping(value="/member_modify")
   public void member_modify() {
      
   }
   
   @RequestMapping(value = "/member_modify", method = RequestMethod.POST)
   public String member_modify(@ModelAttribute MemberVO mem,Model model,HttpServletRequest req) throws Exception {
      MemberVO vo = (MemberVO) WebUtils.getSessionAttribute(req, "USER_KEY");
      System.out.println("modify : "+vo.toString());
      service.modifyMember(mem);
      vo = service.selectMember(vo.getUser_email());
      WebUtils.setSessionAttribute(req, "USER_KEY", vo);
      logger.info("modifyComplete : " + vo.toString());
      return "redirect:/mypage/mypage";
   }
   @RequestMapping(value="/member_logout")
   public String logout(HttpServletRequest req){
      req.getSession().invalidate(); 
      return "redirect:/";
   }
    @RequestMapping("/member/chkUser_email")
    @ResponseBody
    public Map<String, String> chkUser_email(String user_email) throws Exception {
     
     Map<String, String> resultMap = new HashMap<String, String>();
     
     int resultCnt = service.chkUser_email(user_email);
     System.out.println(user_email);
     System.out.println(resultCnt);
     String result = "";
     String resultMsg = "";
     if ( resultCnt == 0 ){
      result = "success";
      resultMsg = "사용가능한 아이디입니다.";
     } else {
      result = "fail";
      resultMsg = "이미 사용중인 아이디입니다.";
     }
     
     resultMap.put("result", result);
     resultMap.put("resultMsg", resultMsg);
     
     return resultMap;
    }
    
    @RequestMapping("/member/chkUser_nick")
    @ResponseBody
    public Map<String, String> chkUser_nick(String user_nick) throws Exception {
     
     Map<String, String> resultMap = new HashMap<String, String>();
     
     int resultCnt = service.chkUser_email(user_nick);
     System.out.println(user_nick);
     System.out.println(resultCnt);
     String result = "";
     String resultMsg = "";
     if ( resultCnt == 0 ){
      result = "success";
      resultMsg = "사용가능한 닉네임입니다.";
     } else {
      result = "fail";
      resultMsg = "이미 사용중인 닉네임입니다.";
     }
     
     resultMap.put("result", result);
     resultMap.put("resultMsg", resultMsg);
     
     return resultMap;
    } 
    
    @RequestMapping(value="/member_findPw")
      public void member_findPw() {
      }
    
       @RequestMapping(value="/member_findPw", method=RequestMethod.POST)
       public String findPw(MemberVO mem, String user_email, String user_nick ,ModelMap model) throws Exception {
           System.out.println(user_email +"," + user_nick);
         MemberVO vo = service.findPw(user_email,user_nick);
         System.out.println(mem.getUser_email());
           String find_email= vo.getUser_email();
           String find_nick= vo.getUser_nick();
           String  find_pw= vo.getUser_pw();
           System.out.println(find_pw);
           if(find_pw!=null) {
               email.setContent(find_nick+"님의 비밀번호는 "+find_pw+" 입니다. 안전한 개인 정보 보호를 위해 로그인 하신 후 비밀번호를 바꿔주세요.");
               email.setReceiver(find_email);
               email.setSubject(find_nick+"님, Tawar 비밀번호 찾기 메일입니다.");
               System.out.println(find_email+","+find_nick+","+find_pw);
               emailSender.SendEmail(email);
               System.out.println("controller : "+email);
               return "/member/findPwDone";
           }else {
               return "home";
           }
       }

    
}