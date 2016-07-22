package com.four.myapp.service;

import java.util.List;
import java.util.Map;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface TopicProposalService {
	public List<TopicProposalDTO> listAll();
	public TopicProposalDTO callTopic(int topic_no);
	public List<ProposalRefDTO> callRefs(int topic_no);
	public List<ReplyDTO> callReplies(int topic_no);
	public TopicProposalDTO callSaved(int user_no) throws Exception;
	public void saveProposal(TopicProposalDTO topicProposalDTO);
	public void voteProposal(int topic_no, int user_no);
	public boolean recommendedHistory(int topic_no, int user_no);
	public void submitProposal(TopicProposalDTO topicProposalDTO, List<String> refTitles, List<String> refLinks);
}
