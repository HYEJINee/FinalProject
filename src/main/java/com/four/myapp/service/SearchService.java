package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.MainDto;

public interface SearchService {

	public List<MainDto> getSearchResult(String search, String search2) throws SQLException;

}
