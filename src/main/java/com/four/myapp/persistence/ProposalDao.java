package com.four.myapp.persistence;

import java.util.List;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface ProposalDao {
	public List<TopicProposalDTO> getTopicList();
	public TopicProposalDTO getTopic(int topic_no);
	public List<ProposalRefDTO> getTopicRefList(int topic_no);
	public List<ReplyDTO> getReplies(int topic_no);
	public void temporarySaveProposal(TopicProposalDTO topicProposalDto);
	public void submitProposal(TopicProposalDTO topicProposalDto);
	public void updateProposal(TopicProposalDTO topicProposalDto);
}
