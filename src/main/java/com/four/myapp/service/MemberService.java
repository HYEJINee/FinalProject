package com.four.myapp.service;

import com.four.myapp.domain.MemberVO;

public interface MemberService {
	public void registMember(MemberVO vo);
	public void modifyMember(MemberVO vo);
	public MemberVO readMember(String user_email) throws Exception;
	public MemberVO readWithPW(String user_email, String user_pw) throws Exception;
	 public int chkUser_email(String user_email) throws Exception; 
	 public int chkUser_nick(String user_nick) throws Exception; 
	 public MemberVO findPw(String user_email, String user_nick);
	 public void member_check(String user_email, String user_check);
}
