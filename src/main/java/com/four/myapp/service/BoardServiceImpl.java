package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.MainDto;
import com.four.myapp.persistence.BoardDAO;
import com.four.myapp.persistence.BoardDaoImpl;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<MainDto> getList() throws SQLException {
		return dao.getList();
	}
	
	public MainDto Read(int topic_no) throws SQLException {
		return dao.Read(topic_no);
	}
}
