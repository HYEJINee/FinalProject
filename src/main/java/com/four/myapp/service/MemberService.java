package com.four.myapp.service;

import com.four.myapp.domain.MemberVO;

public interface MemberService {
	public MemberVO readMember(String user_email) throws Exception;
	public MemberVO readWithPW(String user_email, String user_pw) throws Exception;
}
