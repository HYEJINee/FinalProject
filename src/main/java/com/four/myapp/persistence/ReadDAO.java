package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;

public interface ReadDAO {
	public ReadVO Readdao(int topic_no) throws SQLException;
	public List<ReadResourceVO> getResource(int topic_no) throws SQLException;
	public List<ReadOpinionVO> getOpinion(int topic_no) throws SQLException;
	public void topicvote(int topic_no, int user_no, int vote_type);
	public void votepro(int topic_no);
	public void votecon(int topic_no);
	public void voteneut(int topic_no);
	public ReadVO Readvote(int topic_no, int user_no) throws SQLException;
}

