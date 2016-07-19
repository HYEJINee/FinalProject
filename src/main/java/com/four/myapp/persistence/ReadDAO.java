package com.four.myapp.persistence;

import java.sql.SQLException;

import com.four.myapp.domain.ReadVO;


public interface ReadDAO {
	public ReadVO Readdao() throws SQLException;
}
