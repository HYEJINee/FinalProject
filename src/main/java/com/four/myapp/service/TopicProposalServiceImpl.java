package com.four.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.persistence.ProposalDao;

@Service
public class TopicProposalServiceImpl implements TopicProposalService{
	@Autowired
	private ProposalDao proposalDao;
	
	@Override
	public List<TopicProposalDTO> listAll() {
		return proposalDao.getTopicList();
	}
	
	@Override
	public TopicProposalDTO callTopic(int topic_no) {
		return proposalDao.getTopic(topic_no);
	}

	@Override
	public List<ProposalRefDTO> callRefs(int topic_no) {
		return proposalDao.getTopicRefList(topic_no);
	}
	
	@Override
	public List<ReplyDTO> callReplies(int topic_no) {
		return proposalDao.getReplies(topic_no);
	}
}
