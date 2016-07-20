package com.four.myapp.domain;

public class ReadOpinionVO {
	private int op_no, op_like, vote_type, op_rel;
	private String op_content,  op_regdate, user_nick;
	public int getOp_no() {
		return op_no;
	}
	public void setOp_no(int op_no) {
		this.op_no = op_no;
	}
	public int getOp_like() {
		return op_like;
	}
	public void setOp_like(int op_like) {
		this.op_like = op_like;
	}
	public int getVote_type() {
		return vote_type;
	}
	public void setVote_type(int vote_type) {
		this.vote_type = vote_type;
	}
	public int getOp_rel() {
		return op_rel;
	}
	public void setOp_rel(int op_rel) {
		this.op_rel = op_rel;
	}
	public String getOp_content() {
		return op_content;
	}
	public void setOp_content(String op_content) {
		this.op_content = op_content;
	}
	public String getOp_regdate() {
		return op_regdate;
	}
	public void setOp_regdate(String op_regdate) {
		this.op_regdate = op_regdate;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	
	
	
}
