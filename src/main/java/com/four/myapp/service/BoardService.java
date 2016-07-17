package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.BoardDto;

public interface BoardService {
	public List<BoardDto> getList() throws SQLException;
}
