package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.MainDto;
import com.four.myapp.persistence.ListDAO;

@Service
public class FinishedServiceImpl implements FinishedService {
	@Autowired
	private ListDAO dao;

	@Override
	public List<MainDto> getAll_fin(int index) throws SQLException {
		return dao.getAll_fin(index);
	}

	@Override
	public List<MainDto> getProCon_fin(int index) throws SQLException {
		return dao.getProCon_fin(index);
	}

	@Override
	public List<MainDto> getFree_fin(int index) throws SQLException {
		return dao.getFree_fin(index);
	}
	
}
