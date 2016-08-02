package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface TimelineService {
	public void timelineTopic(TopicProposalDTO topicProposalDTO, String timeline_type) throws SQLException;
	public void timelineVote(TimelineDTO timelineDTO, String timeline_type) throws SQLException;
}
