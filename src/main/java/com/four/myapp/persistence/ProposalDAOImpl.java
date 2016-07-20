package com.four.myapp.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;
import com.mysql.jdbc.Connection;

@Repository
public class ProposalDAOImpl implements ProposalDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.four.myapp.mappers.proposalMapper";

	@Override
	public List<TopicProposalDTO> getTopicList() {
		return sqlSession.selectList(NAMESPACE + ".getList");
	}
	
	@Override
	public TopicProposalDTO getTopic(int topic_no) {
		return sqlSession.selectOne(NAMESPACE + ".getTopic", topic_no);
	}
	
	@Override
	public List<ProposalRefDTO> getTopicRefList(int topic_no) {
		return sqlSession.selectList(NAMESPACE + ".getRef", topic_no);
	}
	
	@Override
	public List<ReplyDTO> getReplies(int topic_no) {
		return sqlSession.selectList(NAMESPACE + ".getReplies", topic_no);
	}
	
	@Override
	public TopicProposalDTO checkSaved(int user_no) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkSaved", user_no);
	}
	
	@Override
	public void registTopic(TopicProposalDTO topicProposalDTO) {
		sqlSession.insert(NAMESPACE + ".proposalUp", topicProposalDTO);
	}
}