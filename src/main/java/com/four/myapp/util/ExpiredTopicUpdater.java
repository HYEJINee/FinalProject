package com.four.myapp.util;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

@Aspect
public class ExpiredTopicUpdater {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ExpiredTopicUpdater.class);
	
	private static final String NAMESPACE = "com.four.myapp.mappers.expiredMapper";
	
	@Pointcut("bean(*DAOImpl)")
	private void targetMethod() { }
	
	@Before("targetMethod()")
	public void beforeTragetMethod(JoinPoint joinPoint) {
		logger.info("AspectUsingAnnotation.beforeTargetMethod executed.");
		
		if(sqlSession.selectList(NAMESPACE + ".checkExpired2").isEmpty() == false) {
			sqlSession.update(NAMESPACE + ".expiredProposal2");
        	logger.info("expired proposal updated.");
        }
		
        if(sqlSession.selectList(NAMESPACE + ".checkExpired").isEmpty() == false) {
        	sqlSession.update(NAMESPACE + ".expiredProposal");
        	logger.info("expired proposal updated.");
        }
	}
}
