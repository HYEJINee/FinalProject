package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface BoardService {
	public List<MainDto> getMainList() throws SQLException;
	public List<MainDto> getRecmdList() throws SQLException;
	public List<MainDto> getFinishedList() throws SQLException;
	public MainDto read(int topic_no) throws SQLException;
}
