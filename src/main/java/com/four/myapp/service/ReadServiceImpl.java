package com.four.myapp.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.ReadVO;
import com.four.myapp.persistence.ReadDAO;

@Service
public class ReadServiceImpl implements ReadService {
	@Inject
	ReadDAO dao;
	
	@Override
	public ReadVO Readdao() throws SQLException {
		// TODO Auto-generated method stub
		return dao.Readdao();
	}

}
