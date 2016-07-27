package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MainDto;

@Repository
public class SearchDAOImpl implements SearchDAO {
	@Autowired
	private SqlSession sqlsession;

	private static final String NAMESPACE = "com.four.mappers.searchMapper";
	@Override
	public List<MainDto> getSearchResult(String search_word) throws SQLException {

		System.out.println("dao: "+search_word);
		return sqlsession.selectList(NAMESPACE+".getSearchResult", search_word);
		 
	}

}
