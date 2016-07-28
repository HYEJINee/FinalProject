package com.four.myapp.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MainDto;
import com.four.myapp.persistence.SearchDAO;

@Repository
public class SearchServiceImpl implements SearchService {
	@Autowired
	SearchDAO dao;
	
	@Override
	public List<MainDto> getSearchResult(String search, String search2) throws SQLException {

		return dao.getSearchResult(search, search2);
		}

}
