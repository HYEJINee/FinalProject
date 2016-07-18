package com.four.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public MemberVO readMember(String user_email) throws Exception {
		return dao.readMember(user_email);
	}

	@Override
	public MemberVO readWithPW(String user_email, String user_pw) throws Exception {
		return dao.readWithPW(user_email, user_pw);
	}

}
