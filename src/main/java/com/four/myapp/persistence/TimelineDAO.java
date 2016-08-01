package com.four.myapp.persistence;

import java.sql.SQLException;

import com.four.myapp.domain.TimelineDTO;

public interface TimelineDAO {
	public void timelineTopic(TimelineDTO timelineDTO) throws SQLException;
	public void timelineVote(TimelineDTO timelineDTO) throws SQLException;
}
