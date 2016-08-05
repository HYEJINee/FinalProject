package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.MainDto;
import com.four.myapp.persistence.ListDAO;

@Service
public class OngoingServiceImpl implements OngoingService {
	@Autowired
	private ListDAO dao;

	@Override
	public List<MainDto> getAll_on(int index) throws SQLException {
		return dao.getAll_on(index);
	}

}
