package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface FinishedService {
	public List<MainDto> getAll_fin(int index) throws SQLException;
}
