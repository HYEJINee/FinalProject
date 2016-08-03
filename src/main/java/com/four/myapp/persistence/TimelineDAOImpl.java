package com.four.myapp.persistence;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;

@Repository
public class TimelineDAOImpl implements TimelineDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.four.mappers.timelineMapper";
	
	private TimelineDTO timelineDTO = new TimelineDTO();
	
	@Override
	public void timelineTopic1(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException {
		//System.out.println(timelineDTO.toString());
		timelineDTO.setUser_no(topicProposalDTO.getUser_no());
		timelineDTO.setTopic_no((int)sqlSession.selectOne(NAMESPACE + ".getLatest", topicProposalDTO.getUser_no()));
		timelineDTO.setTopic_type(topicProposalDTO.getTopic_type());
		timelineDTO.setTimeline_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);
	}
	
	@Override
	public void timelineTopic2to4(int topic_no, String timeline_type) throws SQLException {
		timelineDTO = sqlSession.selectOne(NAMESPACE + ".getTopic", topic_no);
		timelineDTO.setTimeline_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);
	}

	@Override
	public void timelineVote(int topic_no, int user_no, int vote_type, String timeline_type) throws SQLException {
		timelineDTO = sqlSession.selectOne(NAMESPACE + ".getTopic", topic_no);
		timelineDTO.setTopic_no(topic_no);
		timelineDTO.setUser_no(user_no);
		timelineDTO.setVote_type(vote_type);
		timelineDTO.setTimeline_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);
	}

}
