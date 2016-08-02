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
	public void timelineTopic(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException {
		dao.timelineTopic(topicProposalDTO, timeline_type);
	}

	@Override
	public void timelineVote(TimelineDTO timelineDTO, String timeline_type) throws SQLException {
		dao.timelineVote(timelineDTO, timeline_type);
	}

}
