package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.BoardDto;

public interface BoardDAO {
	public List<BoardDto> getList() throws SQLException;
	public BoardDto Read(int topic_no) throws SQLException;
}
