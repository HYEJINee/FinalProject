package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MypageDto;

public interface MypageDAO {
	public List<MypageDto> timeline(String user_no) throws SQLException;
}
