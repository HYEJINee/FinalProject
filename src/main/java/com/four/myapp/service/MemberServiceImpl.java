package com.four.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	@Override
	public void registMember(MemberVO vo) {
		dao.registMember(vo);
	}

	@Override
	public void modifyMember(MemberVO vo) {
		dao.modifyMember(vo);
	}

	@Override
	public MemberVO readMember(String userid) throws Exception {
		return dao.readMember(userid);
	}

	@Override
	public MemberVO readWithPW(String userid, String userpw) throws Exception {
		return dao.readWithPW(userid, userpw);
	}

}
