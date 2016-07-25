package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;
import com.four.myapp.domain.ReadoplikeVO;
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

	@Override
	public void topicvote(int topic_no, int user_no, int vote_type) {
		dao.topicvote(topic_no, user_no, vote_type);
		
	}

	@Override
	public void votepro(int topic_no) {
		dao.votepro(topic_no);
		
	}

	@Override
	public void votecon(int topic_no) {
		dao.votecon(topic_no);
		
	}

	@Override
	public void voteneut(int topic_no) {
		dao.voteneut(topic_no);
		
	}

	@Override
	public ReadVO Readvote(int topic_no, int user_no) throws SQLException {
		return dao.Readvote(topic_no,user_no);
	}

	@Override
	public void likevote(int op_no, int user_no, int op_like_type) {
		dao.likevote(op_no, user_no, op_like_type);
		
	}

	@Override
	public List<ReadoplikeVO> getoplike(int user_no) throws SQLException {
		return dao.getoplike(user_no);
	}

	
}
