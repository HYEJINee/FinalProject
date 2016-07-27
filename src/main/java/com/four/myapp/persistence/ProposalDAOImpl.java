package com.four.myapp.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

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
	
	@Override
	public void recommend(int topic_no, int user_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("topic_no", topic_no);
		map.put("user_no", user_no);
		sqlSession.insert(NAMESPACE + ".recommend", map);
	}
	
	@Override
	public boolean checkRecommended(int topic_no, int user_no) {
		boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("topic_no", topic_no);
		map.put("user_no", user_no);
		if(sqlSession.selectOne(NAMESPACE + ".hadRecommended", map) != null) {
			result = true;
		}
		return result;
	}
	
	@Override
	public void proposalUp(TopicProposalDTO topicProposalDTO, List<String> refTitles, List<String> refLinks) {
		sqlSession.insert(NAMESPACE + ".proposalUp", topicProposalDTO);
		
		int topic_no = sqlSession.selectOne(NAMESPACE + ".getLatest", topicProposalDTO.getUser_no());
		topicProposalDTO.setTopic_no(topic_no);
		
		sqlSession.insert(NAMESPACE + ".proposalDetailUp", topicProposalDTO);
		sqlSession.insert(NAMESPACE + ".imgUp", topicProposalDTO);

		ProposalRefDTO proposalRefDTO = null; 
		for(int refCnt = 0; refCnt < refTitles.size(); refCnt++) {
			proposalRefDTO = new ProposalRefDTO(topicProposalDTO.getTopic_no(), refTitles.get(refCnt), refLinks.get(refCnt));
			sqlSession.insert(NAMESPACE + ".proposalRefUp", proposalRefDTO);
		}
	}
	
	@Override
	public void replyUp(ReplyDTO replyDTO) {
		sqlSession.insert(NAMESPACE + ".commentUp", replyDTO);
	}

	@Override
	public void makeProgress(int topic_no) {
		sqlSession.update(NAMESPACE + ".makeProgress", topic_no);
	}
}