package com.four.myapp.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

@Aspect
public class PointEvaluator {
	@Autowired
	SqlSession sqlSession;
	private static final String NAMESPACE="com.four.myapp.mappers.expiredMapper";

	Logger logger = LoggerFactory.getLogger(PointEvaluator.class);
	
	@AfterReturning("execution(public void replyUp(..))")
	public Object afterCommentUp(JoinPoint joinPoint) throws Throwable {
		ReplyDTO replyDTO = (ReplyDTO)joinPoint.getArgs()[0];
		int user_no = replyDTO.getUser_no(); 
		point_comment(user_no);
		
		return joinPoint;
	}
	
	@AfterReturning("execution(public void proposalUp(..))")
	public Object afterSubmitProposal(JoinPoint joinPoint) {
		TopicProposalDTO topicProposalDTO = (TopicProposalDTO)joinPoint.getArgs()[0];
		int user_no = topicProposalDTO.getUser_no();
		point_proposal(user_no);
		
		return joinPoint;
	}
	
	@AfterReturning("execution(public void insertoption(..))")
	public Object afterinsertOpinion(JoinPoint joinPoint) {
		int user_no = (int)joinPoint.getArgs()[joinPoint.getArgs().length-1];
		point_opinion(user_no);

		return joinPoint;
	}

	@AfterReturning("execution(public void makeProgress(..))")
	public Object afterMakeProgress(JoinPoint joinPoint) {
		int topic_no = (int)joinPoint.getArgs()[joinPoint.getArgs().length-1];
		point_release(topic_no);
		
		return joinPoint;
	}
	
	public void point_comment(int user_no) {
		sqlSession.update(NAMESPACE + ".comment", user_no);
		checkNLevelUp(user_no);
	}
	
	public void point_proposal(int user_no) {
		sqlSession.update(NAMESPACE + ".proposal", user_no);
		checkNLevelUp(user_no);
	}
	
	public void point_opinion(int user_no) {
		sqlSession.update(NAMESPACE + ".opinion", user_no);
		checkNLevelUp(user_no);
	}
	
	public void point_release(int topic_no) {
		int user_no = sqlSession.selectOne(NAMESPACE + ".TopicWriter", topic_no);
		sqlSession.update(NAMESPACE + ".release", user_no);
		checkNLevelUp(user_no);
	}
	
	public void checkNLevelUp(int user_no) {
		int user_point = sqlSession.selectOne(NAMESPACE + ".user_point", user_no);

		if (user_point >= 20) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_no", user_no);
			
			if (user_point >= 500) {
				map.put("user_lv", 4);
				sqlSession.update(NAMESPACE + ".level", map);
			} else if (user_point < 500 && user_point >= 200) {
				map.put("user_lv", 3);
				sqlSession.update(NAMESPACE + ".level", map);
			} else if (user_point < 200 && user_point >= 100) {
				map.put("user_lv", 2);
				sqlSession.update(NAMESPACE + ".level", map);
			} else if (user_point < 100 && user_point >= 20) {
				map.put("user_lv", 1);
				sqlSession.update(NAMESPACE + ".level", map);
			}
		}
	}
}
