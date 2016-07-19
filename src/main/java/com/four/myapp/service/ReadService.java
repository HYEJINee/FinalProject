package com.four.myapp.service;

import java.sql.SQLException;

import com.four.myapp.domain.ReadVO;


public interface ReadService {
	public ReadVO Readdao() throws SQLException;
}
