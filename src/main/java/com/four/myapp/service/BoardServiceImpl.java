package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.PageDto;
import com.four.myapp.persistence.BoardDAO;
import com.four.myapp.persistence.BoardDaoImpl;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	
	@Override
	public PageDto getPageInfo(int nowBlock, int nowPage) {
		return dao.getPageInfo(nowBlock, nowPage);
	}
	
	@Override
	public List<MainDto> getMainList() throws SQLException {
		return dao.getMainList();
	}
	
	@Override
	public List<MainDto> getRecmdList() throws SQLException {
		return dao.getRecmdList();
	}
	
	@Override
	public List<MainDto> getFinishedList() throws SQLException {
		return dao.getFinishedList();
	}
	
	@Override
	public MainDto read(int topic_no) throws SQLException {
		return dao.read(topic_no);
	}
}
