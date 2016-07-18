package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface BoardService {
	public List<MainDto> getList() throws SQLException;
	public MainDto Read(int topic_no) throws SQLException;
}
