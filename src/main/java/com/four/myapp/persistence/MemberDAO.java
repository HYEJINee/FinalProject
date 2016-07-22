package com.four.myapp.persistence;

import com.four.myapp.domain.MemberVO;

public interface MemberDAO {

	public void registMember(MemberVO vo);
	public void modifyMember(MemberVO vo);
	public MemberVO selectMember(String user_email);
	public MemberVO readMember(String user_no) throws Exception;
	public MemberVO readWithPW(String user_email, String user_pw) throws Exception;
	public int chkUser_email(String user_email);
	public int chkUser_nick(String user_nick);
	public MemberVO findPw(String user_email, String user_nick);
	public void member_check(String user_nick, String user_email);
}