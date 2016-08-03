package com.four.myapp.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.persistence.TimelineDAO;

@Repository
public class TimelineServiceImpl implements TimelineService {
	@Autowired
	private TimelineDAO dao;

	@Override
	public void timelineTopic1(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException {
		dao.timelineTopic1(topicProposalDTO, timeline_type);
	}
	
	@Override
	public void timelineTopic2to4(int topic_no, String timeline_type) throws SQLException {
		dao.timelineTopic2to4(topic_no, timeline_type);
	}
	
	@Override
	public void timelineVote(int topic_no, int user_no, int vote_type, String timeline_type) throws SQLException {
		dao.timelineVote(topic_no, user_no, vote_type, timeline_type);
	}
}
