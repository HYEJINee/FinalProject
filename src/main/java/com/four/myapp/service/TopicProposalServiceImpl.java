package com.four.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.persistence.ProposalDAO;

@Service
public class TopicProposalServiceImpl implements TopicProposalService{
	@Autowired
	private ProposalDAO proposalDAO;
	
	@Override
	public List<TopicProposalDTO> listAll() {
		return proposalDAO.getTopicList();
	}
	
	@Override
	public TopicProposalDTO callTopic(int topic_no) {
		return proposalDAO.getTopic(topic_no);
	}

	@Override
	public List<ProposalRefDTO> callRefs(int topic_no) {
		return proposalDAO.getTopicRefList(topic_no);
	}
	
	@Override
	public List<ReplyDTO> callReplies(int topic_no) {
		return proposalDAO.getReplies(topic_no);
	}
	
	@Override
	public TopicProposalDTO callSaved(int user_no) throws Exception {
		return proposalDAO.checkSaved(user_no);
	}

	@Override
	public void saveProposal(TopicProposalDTO topicProposalDTO) {
		proposalDAO.registTopic(topicProposalDTO);
	}
	
	@Override
	public void voteProposal(int topic_no, int user_no) {
		proposalDAO.recommend(topic_no, user_no);
	}
	
	@Override
	public boolean recommendedHistory(int topic_no, int user_no) {
		return proposalDAO.checkRecommended(topic_no, user_no);
	}
}