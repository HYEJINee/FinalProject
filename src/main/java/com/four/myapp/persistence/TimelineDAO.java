package com.four.myapp.persistence;

import java.sql.SQLException;

import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface TimelineDAO {
	public void timelineTopic(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException;
	public void timelineVote(TimelineDTO timelineDTO, String timeline_type) throws SQLException;
}
