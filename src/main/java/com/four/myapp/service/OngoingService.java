package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface OngoingService {
	public List<MainDto> getAll_on(int index) throws SQLException;
}
