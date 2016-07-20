package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;
import com.four.myapp.domain.PageDto;

public interface BoardDAO {
	public PageDto getPageInfo(int nowBlock, int nowPage);
	public List<MainDto> getMainList() throws SQLException;
	public List<MainDto> getRecmdList() throws SQLException;
	public List<MainDto> getFinishedList() throws SQLException;
	public MainDto read(int topic_no) throws SQLException;
}
