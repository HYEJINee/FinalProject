package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.TimelineDTO;

public interface TimellineService {
	public void timelineTopic(TimelineDTO timelineDTO) throws SQLException;
	public void timelineVote(TimelineDTO timelineDTO) throws SQLException;
}
