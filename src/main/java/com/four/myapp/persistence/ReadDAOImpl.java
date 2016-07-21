package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;
@Repository
public class ReadDAOImpl implements ReadDAO {
	@Inject
	   private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.four.mappers.readMapper";

	@Override
	public ReadVO Readdao(int topic_no) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectRead", topic_no);
		
	}

	@Override
	public List<ReadResourceVO> getResource(int topic_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE+".selectResource", topic_no);
	}

	@Override
	public List<ReadOpinionVO> getOpinion(int topic_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE+".selectOpinion", topic_no);
	}
	
}
