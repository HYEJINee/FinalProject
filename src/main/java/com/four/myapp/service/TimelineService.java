package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface TimelineService {
	public void timelineTopic1(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException;
	public void timelineTopic2to4(int topic_no, String timeline_type) throws SQLException;
	public void timelineVote(int topic_no, int user_no, String vote_type, String timeline_type) throws SQLException;
	public void notiReply(int other_user_no, int topic_no,  int reop_no) throws SQLException;
}
