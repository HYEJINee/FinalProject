package com.four.myapp.persistence;

import java.util.List;
import java.util.Map;

import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface ProposalDAO {
	public List<TopicProposalDTO> getTopicList(int index);
	public TopicProposalDTO getTopic(int topic_no);
	public List<ProposalRefDTO> getTopicRefList(int topic_no);
	public List<ReplyDTO> getReplies(Map<String, Object> map);
	public TopicProposalDTO checkSaved(int user_no) throws Exception;
	public void registTopic(TopicProposalDTO topicProposalDTO);
	public void recommend(Map<String, Object> map);
	public boolean checkRecommended(Map<String, Object> map);
	public void proposalUp(TopicProposalDTO topicProposalDTO, List<String> refTitles, List<String> refLinks);
	public void replyUp(ReplyDTO replyDTO);
	public void makeProgress(int topic_no);
	public void replyUpdate(ReplyDTO replyDTO);
	public void replyDelete(int reply_no);
}
