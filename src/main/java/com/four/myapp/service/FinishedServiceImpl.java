package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.MainDto;
import com.four.myapp.persistence.FinishedDAO;

@Service
public class FinishedServiceImpl implements FinishedService {
	@Autowired
	private FinishedDAO dao;
	
	@Override
	public List<MainDto> getAll() throws SQLException {
		return dao.getAll();
	}

	@Override
	public List<MainDto> getProCon() throws SQLException {
		return dao.getProCon();
	}

	@Override
	public List<MainDto> getFree() throws SQLException {
		return dao.getFree();
	}

}
