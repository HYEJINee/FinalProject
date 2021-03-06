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
	public void registMember(MemberVO vo) {
		dao.registMember(vo);
	}

	@Override
	public void modifyMember(MemberVO vo) {
		dao.modifyMember(vo);
	}


	@Override
	public MemberVO readWithPW(String user_email, String user_pw) throws Exception {
		return dao.readWithPW(user_email, user_pw);
	}

	@Override
	public int chkUser_email(String user_email) throws Exception {
		return dao.chkUser_email(user_email);
	}

	@Override
	public int chkUser_nick(String user_nick) throws Exception {
		return dao.chkUser_nick(user_nick);
	}

	@Override
	public MemberVO findPw(String user_email, String user_nick) {
		return dao.findPw(user_email, user_nick);
	}

	@Override
	public void member_check(String user_email, String user_check) {
		dao.member_check(user_email, user_check);
	}

	@Override
	public MemberVO selectMember(String user_email) {
		return dao.selectMember(user_email);
	}
 

}
