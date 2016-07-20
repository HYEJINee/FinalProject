package com.four.myapp.persistence;

import java.util.List;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface ProposalDAO {
	public List<TopicProposalDTO> getTopicList();
	public TopicProposalDTO getTopic(int topic_no);
	public List<ProposalRefDTO> getTopicRefList(int topic_no);
	public List<ReplyDTO> getReplies(int topic_no);
	public TopicProposalDTO checkSaved(int user_no) throws Exception;
	public void registTopic(TopicProposalDTO topicProposalDTO);
}
