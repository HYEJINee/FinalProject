package com.four.myapp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.four.myapp.domain.MemberVO;
import com.four.myapp.domain.ProposalRefDTO;
import com.four.myapp.domain.ReplyDTO;
import com.four.myapp.domain.TopicProposalDTO;
import com.four.myapp.persistence.ProposalDAO;
import com.four.myapp.util.CoverImgValidation;

@Service
public class TopicProposalServiceImpl implements TopicProposalService{
	@Autowired
	private ProposalDAO proposalDAO;
	
	@Override
	public List<TopicProposalDTO> listAll(int pageNo) {
		int index = (pageNo-1) * 10;
		return proposalDAO.getTopicList(index);
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
	public List<ReplyDTO> callReplies(int topic_no, int pageNo) {
		int index = (pageNo-1) * 7;
		return proposalDAO.getReplies(topic_no, index);
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
	public void voteProposal(MemberVO memberVO,int topic_no) {
	    int user_no = Integer.parseInt(memberVO.getUser_no());
		
		proposalDAO.recommend(topic_no, user_no);
	}
	
	@Override
	public boolean recommendedHistory(int topic_no, int user_no) {
		return proposalDAO.checkRecommended(topic_no, user_no);
	}
	
	@Override
	public void submitProposal(MemberVO memberVO, MultipartFile multipartFile, String filePath, TopicProposalDTO topicProposalDTO, List<String> refTitles, List<String> refLinks) throws IOException {
		int user_no = Integer.parseInt(memberVO.getUser_no());
		topicProposalDTO.setUser_no(user_no);
		topicProposalDTO.setTopic_short_cont(topicProposalDTO.getTopic_short_cont().replaceAll("\r\n", "<br>"));
		if(topicProposalDTO.getTopic_con() != null) {
			topicProposalDTO.setTopic_pro(topicProposalDTO.getTopic_pro().replaceAll("\r\n", "<br>"));
			topicProposalDTO.setTopic_con(topicProposalDTO.getTopic_con().replaceAll("\r\n", "<br>"));
		}
		
		if(multipartFile.isEmpty() == false) {
			String ori_fileName = multipartFile.getOriginalFilename();
			String ex = ori_fileName.substring(ori_fileName.lastIndexOf(".") + 1);
		   
			boolean typeValidation = CoverImgValidation.imageValidator(multipartFile.getBytes());
		
			if(typeValidation) {
				String fileName = memberVO.getUser_nick() + "_" +(System.currentTimeMillis()/1000);
				File file = new File(filePath + fileName + "." + ex);
			   
				multipartFile.transferTo(file);
				topicProposalDTO.setImg_file_name(fileName);
				topicProposalDTO.setImg_ext_name(ex);
			}
		}
		proposalDAO.proposalUp(topicProposalDTO, refTitles, refLinks);
	}
	
	@Override
	public void commentUp(MemberVO memberVO, ReplyDTO replyDTO) {
		int user_no = Integer.parseInt(memberVO.getUser_no());
		replyDTO.setUser_no(user_no);
		replyDTO.setReply_content(replyDTO.getReply_content().replaceAll("\r\n", "<br>"));
		proposalDAO.replyUp(replyDTO);
	}
	
	@Override
	public void proposalToGo(int topic_no) {
		proposalDAO.makeProgress(topic_no);
	}
	
	@Override
	public void modReply(ReplyDTO replyDTO) {
		replyDTO.setReply_content(replyDTO.getReply_content().replaceAll("\r\n", "<br>"));
		proposalDAO.replyUpdate(replyDTO);
	}
	
	@Override
	public void delReply(int reply_no) {
		proposalDAO.replyDelete(reply_no);
	}
}
