package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;

public interface ReadDAO {
	public ReadVO Readdao(int topic_no) throws SQLException;
	public List<ReadResourceVO> getResource() throws SQLException;
	public List<ReadOpinionVO> getOpinion() throws SQLException;
}
