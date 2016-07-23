package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;
import com.four.myapp.domain.ReadoplikeVO;
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

	@Override
	public void topicvote(int topic_no, int user_no, int vote_type) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("topic_no", topic_no);
		map.put("user_no", user_no);
		map.put("vote_type", vote_type);
		sqlSession.insert(NAMESPACE + ".topicvoteinsert", map);
	}

	@Override
	public void votepro(int topic_no) {
		sqlSession.insert(NAMESPACE + ".votepro", topic_no);
		
	}

	@Override
	public void votecon(int topic_no) {
		sqlSession.insert(NAMESPACE + ".votecon", topic_no);
		
	}

	@Override
	public void voteneut(int topic_no) {
		sqlSession.insert(NAMESPACE + ".voteneut", topic_no);
		
	}

	@Override
	public ReadVO Readvote(int topic_no, int user_no) throws SQLException {
		Map<String, Object> vote = new HashMap<String, Object>();
		vote.put("topic_no", topic_no);
		vote.put("user_no", user_no);
		return sqlSession.selectOne(NAMESPACE + ".readvote", vote);
		
	}

	@Override
	public void likevote(int op_no, int user_no, int op_like_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("op_no", op_no);
		map.put("user_no", user_no);
		map.put("op_like", op_like_type);
		sqlSession.insert(NAMESPACE + ".likevoteinsert", map);
		
	}

	@Override
	public List<ReadoplikeVO> getoplike(int user_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE+".readoplike", user_no);
	}

	
	
}
