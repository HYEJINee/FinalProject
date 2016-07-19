package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MainDto;

@Repository
public class BoardDaoImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlsession;
	private static final String NAMESPACE = "com.four.mappers.boardMapper";
	
	@Override
	public List<MainDto> getMainList() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getMainList");
	}

	@Override
	public List<MainDto> getBoardList() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getBoardList");
	}
	
	@Override
	public MainDto read(int topic_no) throws SQLException {
		return sqlsession.selectOne(NAMESPACE + ".read" , topic_no);
	}

}
