package com.four.myapp.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.four.myapp.domain.NotiDTO;
import com.four.myapp.domain.TimelineDTO;

@Aspect
public class ExpiredTopicUpdater {
	@Autowired
	SqlSession sqlSession;
	Logger logger = LoggerFactory.getLogger(ExpiredTopicUpdater.class);
	
	private static final String NAMESPACE = "com.four.myapp.mappers.expiredMapper";
	private static final String timelineNAMESPACE = "com.four.myapp.mappers.timelineMapper";
	
	private List<Integer> failed = new ArrayList<Integer>();
	private List<Integer> finished = new ArrayList<Integer>();
	NotiDTO notiDTO = new NotiDTO();
	TimelineDTO timelineDTO = new TimelineDTO();
	
	@Pointcut("bean(*DAOImpl)")
	private void targetMethod() { }
	
	@Before("targetMethod()")
	public void beforeTragetMethod(JoinPoint joinPoint) {
		logger.info("AspectUsingAnnotation.beforeTargetMethod executed.");
		
        if(sqlSession.selectList(NAMESPACE + ".checkExpired").isEmpty() == false) {
        	failed = sqlSession.selectList(NAMESPACE + ".checkExpired");
        	
        	//Timeline-Noti ("2") update
        	for(int i=0; i<failed.size(); i++) {
        		int topic_no = failed.get(i);
        		timelineDTO = sqlSession.selectOne(NAMESPACE + ".getTimelineDTO", topic_no);
        		timelineDTO.setTimeline_type("2");
        		System.out.println(timelineDTO.toString());
        		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);
        		
        		notiDTO.setUser_no(timelineDTO.getUser_no());
        		notiDTO.setTopic_no(topic_no);
        		notiDTO.setNoti_type("2");
        		sqlSession.insert(NAMESPACE + ".notiTopic", notiDTO);
        	}
        	
        	sqlSession.update(NAMESPACE + ".expiredProposal");
        	logger.info("expired proposal updated.");
        }
		
		if(sqlSession.selectList(NAMESPACE + ".checkExpired2").isEmpty() == false) {
			failed = sqlSession.selectList(NAMESPACE + ".checkExpired2");
        	
        	//Timeline-Noti ("4") update
        	for(int i=0; i<failed.size(); i++) {
        		int topic_no = failed.get(i);
        		timelineDTO = sqlSession.selectOne(NAMESPACE + ".getTimelineDTO", topic_no);
        		timelineDTO.setTimeline_type("4");
        		System.out.println(timelineDTO.toString());
        		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);
        		
        		notiDTO.setUser_no(timelineDTO.getUser_no());
        		notiDTO.setTopic_no(topic_no);
        		notiDTO.setNoti_type("4");
        		sqlSession.insert(NAMESPACE + ".notiTopic", notiDTO);
        	}
        	
        	sqlSession.update(NAMESPACE + ".expiredProposal2");
        	logger.info("expired proposal updated.");
        }

	}
}
