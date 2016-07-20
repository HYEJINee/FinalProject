package com.four.myapp.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {
   @Inject
   private SqlSession sqlSession;

   private static final String NAMESPACE = "com.four.mappers.memberMapper";

   @Override
   public void registMember(MemberVO vo) {

      sqlSession.insert(NAMESPACE+".registMember", vo);      
   }
   @Override
   public void modifyMember(MemberVO vo) {

      sqlSession.update(NAMESPACE+".modifyMember", vo);      
      
   }


   @Override
   public MemberVO readMember(String user_email) throws Exception {
      return sqlSession.selectOne(NAMESPACE + ".readMember", user_email);
   } 

   @Override
   public MemberVO readWithPW(String user_email, String user_pw) throws Exception {
      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put("user_email", user_email);
      paramMap.put("user_pw", user_pw);
      MemberVO vo =  sqlSession.selectOne(NAMESPACE + ".readWithPW", paramMap);
      
      if(vo==null){
         throw new Exception();
      }
      return vo;
   }
@Override
public int chkUser_email(String user_email) {
	return sqlSession.selectOne(NAMESPACE+".chkUser_email", user_email);
}
@Override
public int chkUser_nick(String user_nick) {
	return sqlSession.selectOne(NAMESPACE+".chkUser_nick", user_nick);
}
@Override
public MemberVO findPw(String user_email, String user_nick) {
	 Map<String, String> paramMap = new HashMap<String, String>();
     paramMap.put("user_email", user_email);
     paramMap.put("user_nick", user_nick);
     MemberVO vo =  sqlSession.selectOne(NAMESPACE + ".findPw", paramMap);
     
     return vo;
}
@Override
public void member_check(String user_check, String user_email) {
	Map<String, String> paramMap = new HashMap<String, String>();
    paramMap.put("user_check", user_check);
    paramMap.put("user_email", user_email);
    sqlSession.update(NAMESPACE+".member_check",paramMap);      
}
   
}