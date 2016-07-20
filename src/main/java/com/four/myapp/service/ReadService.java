package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;


public interface ReadService {
	public ReadVO Readdao() throws SQLException;
	public List<ReadResourceVO> getResource() throws SQLException;
	public List<ReadOpinionVO> getOpinion() throws SQLException;
}
