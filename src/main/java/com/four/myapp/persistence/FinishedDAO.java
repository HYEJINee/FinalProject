package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface FinishedDAO {
	public List<MainDto> getAll() throws SQLException;
	public List<MainDto> getProCon() throws SQLException;
	public List<MainDto> getFree() throws SQLException;
}
