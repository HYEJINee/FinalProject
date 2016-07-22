package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.TimelineDTO;
import com.four.myapp.persistence.MypageDAO;
import com.four.myapp.persistence.MypageDAOImpl;

@Service
public class MypageServiceImpl implements MypageService {
	@Inject
	MypageDAO dao;
	
	@Override
	public List<TimelineDTO> timeline(String user_no) throws SQLException {
		return dao.timeline(user_no);
	}

	@Override
	public List<TimelineDTO> getNoti(String user_no) throws SQLException {
		return dao.getNoti(user_no);
	}
	
}
