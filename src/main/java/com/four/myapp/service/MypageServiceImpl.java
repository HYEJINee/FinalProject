package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.MypageDto;
import com.four.myapp.persistence.MypageDAO;
import com.four.myapp.persistence.MypageDAOImpl;

@Service
public class MypageServiceImpl implements MypageService {
	@Inject
	MypageDAO dao;
	
	@Override
	public List<MypageDto> timeline(String user_no) throws SQLException {
		System.out.println("ServiceImpl : " + user_no );
		return dao.timeline(user_no);
	}

}
