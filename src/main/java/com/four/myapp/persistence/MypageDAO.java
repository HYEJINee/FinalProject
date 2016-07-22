package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.TimelineDTO;

public interface MypageDAO {
	public List<TimelineDTO> timeline(String user_no) throws SQLException;
	public List<TimelineDTO> getNoti(String user_no) throws SQLException;
}
