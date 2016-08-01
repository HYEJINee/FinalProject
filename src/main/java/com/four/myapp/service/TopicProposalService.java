package com.four.myapp.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;

public interface TopicProposalService {
	public List<TopicProposalDTO> listAll(int index);
	public TopicProposalDTO callTopic(int topic_no);
	public List<ProposalRefDTO> callRefs(int topic_no);
	public List<ReplyDTO> callReplies(int topic_no, int pageNo);
	public TopicProposalDTO callSaved(int user_no) throws Exception;
	public void saveProposal(TopicProposalDTO topicProposalDTO);
	public void voteProposal(MemberVO memberVO, int topic_no);
	public boolean recommendedHistory(int topic_no, int user_no);
	public void submitProposal(MemberVO memberVO, MultipartFile multipartFile, String filePath, TopicProposalDTO topicProposalDTO, List<String> refTitles, List<String> refLinks) throws IOException;
	public void commentUp(MemberVO memberVO, ReplyDTO replyDTO);
	public void proposalToGo(int topic_no);
	public void modReply(ReplyDTO replyDTO);
	public void delReply(int reply_no);
}
