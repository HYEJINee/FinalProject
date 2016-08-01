package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.TimelineDTO;

public interface MypageService {
	public List<TimelineDTO> timeline(String user_no) throws SQLException;
	public List<TimelineDTO> getNoti(String user_no) throws SQLException;
	public void dismissNoti(String noti_no) throws SQLException;
	public List<MainDto> getMyList(String user_no) throws SQLException;
	public List<MainDto> getMyRecmdList(String user_no) throws SQLException;
	public List<MainDto> getMyFinishList(String user_no) throws SQLException;
	public void uploadProfile(MemberVO memberVO) throws SQLException;
}
