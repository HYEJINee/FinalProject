package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.MainDto;

@Repository
public class ListDAOImpl implements ListDAO {
	@Autowired
	private SqlSession sqlsession;

	private static final String NAMESPACE = "com.four.mappers.listMapper";
	
	@Override
	public List<MainDto> getMainList() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getMainList");
	}

	@Override
	public List<MainDto> getRecmdList() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getRecmdList");
	}
	
	@Override
	public List<MainDto> getFinishedList() throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getFinishedList");
	}
	
	@Override
	public List<MainDto> getAll_on(int index) throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getAll_on", index);
	}

	@Override
	public List<MainDto> getProCon_on(int index) throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getProCon_on", index);
	}

	@Override
	public List<MainDto> getFree_on(int index) throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getFree_on", index);
	}
	
	@Override
	public List<MainDto> getAll_fin(int index) throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getAll_fin", index);
	}

	@Override
	public List<MainDto> getProCon_fin(int index) throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getProCon_fin", index);
	}

	@Override
	public List<MainDto> getFree_fin(int index) throws SQLException {
		return sqlsession.selectList(NAMESPACE + ".getFree_fin", index);
	}


}
