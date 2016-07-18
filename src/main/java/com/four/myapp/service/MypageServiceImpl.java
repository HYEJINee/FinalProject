package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MypageDto;
import com.four.myapp.persistence.MypageDAO;
import com.four.myapp.persistence.MypageDAOImpl;

public class MypageServiceImpl implements MypageService {
	MypageDAO dao = new MypageDAOImpl();
	
	@Override
	public List<MypageDto> timeline() throws SQLException {
		return dao.timeline();
	}

}
