package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MainDto;

@Repository
public class FinishedDAOImpl implements FinishedDAO {
	@Autowired
	private SqlSession sqlsession;
	private static final String NAMESPACE = "com.four.mappers.finishedMapper";
	
	@Override
	public List<MainDto> getAll() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getAll");
	}

	@Override
	public List<MainDto> getProCon() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getProCon");
	}

	@Override
	public List<MainDto> getFree() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getFree");
	}

}
