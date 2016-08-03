package com.four.myapp.persistence;

import java.sql.SQLException;

import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface TimelineDAO {
	public void timelineTopic1(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException;
	public void timelineTopic2to4(int topic_no, String timeline_type) throws SQLException;
	public void timelineVote(int topic_no, int user_no, String vote_type, String timeline_type) throws SQLException;
	public void notiReply(int other_user_no, int topic_no, int reop_no) throws SQLException;
}
