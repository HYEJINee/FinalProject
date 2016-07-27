package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface SearchDAO {
	public List<MainDto> getSearchResult(String search_word) throws SQLException;
}
