package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.MainDto;
import com.four.myapp.persistence.ListDAO;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private ListDAO dao;
	
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
}
