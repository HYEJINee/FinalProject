package com.four.myapp.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.util.WebUtils;

import com.four.myapp.domain.MemberVO;


@Repository
public class MemberDaoImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.four.mappers.memberMapper";

	@Override
	public void registMember(MemberVO vo) {

		sqlSession.insert(namespace+".registMember", vo);		
	}
	@Override
	public void modifyMember(MemberVO vo) {

		sqlSession.update(namespace+".modifyMember", vo);		
		
	}


	@Override
	public MemberVO readMember(String userid) throws Exception {
		return (MemberVO)sqlSession.selectOne(namespace+".selectMember", userid);
	}

	@Override
	public MemberVO readWithPW(String userid, String pw) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("userpw", pw);
		
		MemberVO vo = sqlSession.selectOne(namespace+".readWithPW", paramMap);
		if(vo==null){
			throw new Exception();
		}
		return vo;
	}



	
}