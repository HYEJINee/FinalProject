package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MypageDto;

public interface MypageService {
	public List<MypageDto> timeline() throws SQLException;
}
