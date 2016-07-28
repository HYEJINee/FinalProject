package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<MainDto> getSearchResult(String search, String search2) throws SQLException {
		Map<String, String> paramMap = new HashMap<String, String>();
	    paramMap.put("search", search);
	    paramMap.put("search2", search2);

		return sqlsession.selectList(NAMESPACE+".getSearchResult", paramMap);
		 
	}

}
