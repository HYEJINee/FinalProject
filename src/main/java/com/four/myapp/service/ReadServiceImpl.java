package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;
import com.four.myapp.persistence.ReadDAO;

@Service
public class ReadServiceImpl implements ReadService {
	@Inject
	ReadDAO dao;
	
	@Override
	public ReadVO Readdao(int topic_no) throws SQLException {
		// TODO Auto-generated method stub
		return dao.Readdao(topic_no);
	}

	@Override
	public List<ReadResourceVO> getResource(int topic_no) throws SQLException {
		return dao.getResource(topic_no);
	}

	@Override
	public List<ReadOpinionVO> getOpinion(int topic_no) throws SQLException {
		return dao.getOpinion(topic_no);
	}
	
}
