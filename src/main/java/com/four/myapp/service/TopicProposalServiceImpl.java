package com.four.myapp.service;

import java.util.List;

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
}
