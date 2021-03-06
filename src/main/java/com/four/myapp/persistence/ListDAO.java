package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface ListDAO {
	public List<MainDto> getMainList() throws SQLException;
	public List<MainDto> getRecmdList() throws SQLException;
	public List<MainDto> getFinishedList() throws SQLException;
	
	public List<MainDto> getAll_on(int index) throws SQLException;
	
	public List<MainDto> getAll_fin(int index) throws SQLException;
}
