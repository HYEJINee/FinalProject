package com.four.myapp.persistence;

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
	public List<TopicProposalDTO> getTopicList(int index) {
		return sqlSession.selectList(NAMESPACE + ".getList", index);
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
	public List<ReplyDTO> getReplies(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getReplies", map);
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
	public void recommend(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".recommend", map);
	}
	
	@Override
	public boolean checkRecommended(Map<String, Object> map) {
		boolean result = false;
		if(sqlSession.selectOne(NAMESPACE + ".hadRecommended", map) != null) {
			result = true;
		}
		return result;
	}
	
	@Override
	public void proposalUp(TopicProposalDTO topicProposalDTO, List<String> refTitles, List<String> refLinks) {
		sqlSession.insert(NAMESPACE + ".proposalUp", topicProposalDTO);
		
		topicProposalDTO.setTopic_no((int)sqlSession.selectOne(NAMESPACE + ".getLatest", topicProposalDTO.getUser_no()));
		
		sqlSession.insert(NAMESPACE + ".proposalDetailUp", topicProposalDTO);
		
		if(topicProposalDTO.getImg_file_name() != null) {
			sqlSession.insert(NAMESPACE + ".imgUp", topicProposalDTO);
		}
		
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
		sqlSession.insert(NAMESPACE + ".addDebateTbl", topic_no); 
	}
	
	@Override
	public void replyUpdate(ReplyDTO replyDTO) {
		sqlSession.update(NAMESPACE + ".modReply", replyDTO);
	}
	
	@Override
	public void replyDelete(int reply_no) {
		sqlSession.delete(NAMESPACE + ".delReply", reply_no);
	}
}