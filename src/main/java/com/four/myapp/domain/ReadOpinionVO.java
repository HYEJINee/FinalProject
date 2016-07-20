package com.four.myapp.domain;

public class ReadOpinionVO {
	private int op_no,user_no,topic_no, vote_type;
	private String op_content, op_rel, op_regdate, user_nick;
	
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getVote_type() {
		return vote_type;
	}
	public void setVote_type(int vote_type) {
		this.vote_type = vote_type;
	}
	public int getOp_no() {
		return op_no;
	}
	public void setOp_no(int op_no) {
		this.op_no = op_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(int topic_no) {
		this.topic_no = topic_no;
	}
	public String getOp_content() {
		return op_content;
	}
	public void setOp_content(String op_content) {
		this.op_content = op_content;
	}
	public String getOp_rel() {
		return op_rel;
	}
	public void setOp_rel(String op_rel) {
		this.op_rel = op_rel;
	}
	public String getOp_regdate() {
		return op_regdate;
	}
	public void setOp_regdate(String op_regdate) {
		this.op_regdate = op_regdate;
	}
	
}
