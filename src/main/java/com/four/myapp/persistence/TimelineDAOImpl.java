package com.four.myapp.persistence;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.NotiDTO;
import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;

@Repository
public class TimelineDAOImpl implements TimelineDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.four.mappers.timelineMapper";

	private TimelineDTO timelineDTO = new TimelineDTO();
	private NotiDTO notiDTO = new NotiDTO();

	@Override
	public void timelineTopic1(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException {
		// System.out.println(timelineDTO.toString());
		timelineDTO.setUser_no(topicProposalDTO.getUser_no());
		timelineDTO.setTopic_no((int) sqlSession.selectOne(NAMESPACE + ".getLatest", topicProposalDTO.getUser_no()));
		timelineDTO.setTopic_type(topicProposalDTO.getTopic_type());
		timelineDTO.setTimeline_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);
	}

	@Override
	public void timelineTopic2to4(int topic_no, String timeline_type) throws SQLException {
		timelineDTO = sqlSession.selectOne(NAMESPACE + ".getTopic", topic_no);
		timelineDTO.setTimeline_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".timelineTopic", timelineDTO);

		notiDTO.setUser_no(timelineDTO.getUser_no());
		notiDTO.setTopic_no(timelineDTO.getTopic_no());
		notiDTO.setNoti_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".notiTopic", notiDTO);
	}

	@Override
	public void timelineVote(int topic_no, int user_no, String vote_type, String timeline_type) throws SQLException {
		timelineDTO = sqlSession.selectOne(NAMESPACE + ".getTopic", topic_no);
		timelineDTO.setTopic_no(topic_no);
		timelineDTO.setUser_no(user_no);
		timelineDTO.setVote_type(vote_type);
		timelineDTO.setTimeline_type(timeline_type);
		sqlSession.insert(NAMESPACE + ".timelineVote", timelineDTO);
	}

	@Override
	public void notiReply(int other_user_no, int topic_no, int reop_no) throws SQLException {
		System.out.println("other user no = " + other_user_no);
		int user_no = sqlSession.selectOne(NAMESPACE + ".getUser", reop_no); // 답글이
																				// 달린
																				// 의견을
																				// 썼던
																				// 유저
																				// 찾기
		System.out.println("user no = " + user_no);
		notiDTO.setUser_no(user_no);
		notiDTO.setTopic_no(topic_no);
		notiDTO.setOther_user_no(other_user_no);
		sqlSession.insert(NAMESPACE + ".notiReply", notiDTO);
	}

}
