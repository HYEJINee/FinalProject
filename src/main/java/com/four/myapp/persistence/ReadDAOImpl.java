package com.four.myapp.persistence;

import java.sql.SQLException;
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
import com.four.myapp.domain.ReadtagVO;
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
	public List<ReadOpinionVO> getOpinion(int topic_no, int index) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("topic_no", topic_no);
		map.put("index", index);
		return sqlSession.selectList(NAMESPACE+".selectOpinion", map);
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

	@Override
	public void insertopt(int topic_no, String recontent, int rel, int optionchk, int user_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("topic_no", topic_no);
		map.put("op_content", recontent);
		map.put("op_rel", rel);
		map.put("vote_type", optionchk);
		map.put("user_no", user_no);
		sqlSession.insert(NAMESPACE + ".insertoption", map);
		
	}

	@Override
	public void updateoption(int reupopno, String reupcontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("op_no", reupopno);
		map.put("op_content", reupcontent);
		sqlSession.update(NAMESPACE + ".updateoption", map);
		
	}

	@Override
	public void deletelike(int op_no) {
		sqlSession.delete(NAMESPACE + ".deletelike", op_no);
		
	}

	@Override
	public void deleteoption(int op_no) {
		sqlSession.delete(NAMESPACE + ".deleteoption", op_no);
		
	}

	@Override
	public void inserttag(int rel, int reop_no , int topic_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tagged_op_no", rel);
		map.put("tag_op_no", reop_no);
		map.put("topic_no", topic_no);
		sqlSession.update(NAMESPACE + ".inserttag", map);
		
	}

	@Override
	public ReadVO selectcomment(int rel, String recontent, int optionchk, int user_no) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("op_rel", rel);
		map.put("op_content", recontent);
		map.put("vote_type", optionchk);
		map.put("user_no", user_no);
		return sqlSession.selectOne(NAMESPACE + ".selectcomment", map);
	}

	@Override
	public List<ReadtagVO> getTaglist(int topic_no) throws SQLException {
		return sqlSession.selectList(NAMESPACE+".taglist", topic_no);
	}

	@Override
	public void deletetag(int op_no) {
		sqlSession.delete(NAMESPACE + ".deletetag", op_no);
		
	}

	@Override
	public void deletetagged(int op_no) {
		sqlSession.delete(NAMESPACE + ".deletetagged", op_no);
		
	}
}
