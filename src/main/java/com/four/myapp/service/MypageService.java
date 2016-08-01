package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.TimelineDTO;

public interface MypageService {
	public List<TimelineDTO> timeline(String user_no) throws SQLException;
	public List<TimelineDTO> getNoti(String user_no) throws SQLException;
	public void dismissNoti(String noti_no) throws SQLException;
}
