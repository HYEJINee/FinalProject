package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface BoardDAO {
	public List<MainDto> getList() throws SQLException;
	public MainDto Read(int topic_no) throws SQLException;
}
