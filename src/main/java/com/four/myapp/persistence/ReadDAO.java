package com.four.myapp.persistence;

import java.sql.SQLException;
import java.util.List;

import com.four.myapp.domain.ReadOpinionVO;
import com.four.myapp.domain.ReadResourceVO;
import com.four.myapp.domain.ReadVO;
import com.four.myapp.domain.ReadoplikeVO;
import com.four.myapp.domain.ReadtagVO;

public interface ReadDAO {
	public ReadVO Readdao(int topic_no) throws SQLException;
	public List<ReadResourceVO> getResource(int topic_no) throws SQLException;
	public List<ReadOpinionVO> getOpinion(int topic_no) throws SQLException;
	public void topicvote(int topic_no, int user_no, int vote_type);
	public void votepro(int topic_no);
	public void votecon(int topic_no);
	public void voteneut(int topic_no);
	public ReadVO Readvote(int topic_no, int user_no) throws SQLException;
	public void likevote(int op_no, int user_no, int op_like_type);
	public List<ReadoplikeVO> getoplike(int user_no) throws SQLException;
	public void insertoption(int topic_no, String recontent, int rel, int optionchk, int user_no);
	public void updateoption(int reupopno, String reupcontent);
	public void deletetag(int op_no);
	public void deletelike(int op_no);
	public void deleteoption(int op_no);
	public ReadVO selectcomment(int rel, String recontent, int optionchk, int user_no) throws SQLException;
	public void inserttag(int rel, int reop_no, int topic_no);
	public List<ReadtagVO> getTaglist(int topic_no) throws SQLException;
}

