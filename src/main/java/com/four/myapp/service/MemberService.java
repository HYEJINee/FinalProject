package com.four.myapp.service;

import com.four.myapp.domain.MemberVO;

public interface MemberService {
	public void registMember(MemberVO vo);
	public void modifyMember(MemberVO vo);
	public MemberVO readMember(String userid) throws Exception;
	public MemberVO readWithPW(String userid, String userpw) throws Exception;

}
