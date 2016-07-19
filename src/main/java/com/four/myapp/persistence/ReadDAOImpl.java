package com.four.myapp.persistence;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.ReadVO;
@Repository
public class ReadDAOImpl implements ReadDAO {
	@Inject
	   private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.four.mappers.readMapper";

	@Override
	public ReadVO Readdao() throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectRead");
		
	}

}
