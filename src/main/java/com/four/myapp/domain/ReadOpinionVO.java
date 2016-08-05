package com.four.myapp.domain;
import java.sql.Date;
public class ReadOpinionVO {
	private int op_no, op_like, vote_type, op_rel, user_lv, op_count, user_no;
	private String op_content,  user_nick,  user_profile;
	private Date op_regdate;
	private String user_lv_img;
	
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public Date getOp_regdate() {
		return op_regdate;
	}
	public void setOp_regdate(Date op_regdate) {
		this.op_regdate = op_regdate;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getOp_count() {
		return op_count;
	}
	public void setOp_count(int op_count) {
		this.op_count = op_count;
	}
	public int getUser_lv() {
		return user_lv;
	}
	public void setUser_lv(int user_lv) {
		this.user_lv = user_lv;
		setUser_lv_img(user_lv);
	}
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
	
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	
	public String getUser_lv_img() {
		return user_lv_img;
	}

	public void setUser_lv_img(int user_lv) {
		switch (user_lv) {
		case 0 : 
			this.user_lv_img = "/resources/user_lv/common.png";
			break;
		case 1 : 
			this.user_lv_img = "/resources/user_lv/prestige.png";
			break;
		case 2 : 
			this.user_lv_img = "/resources/user_lv/royal.png";
			break;
		case 3 : 
			this.user_lv_img = "/resources/user_lv/vip.png";
			break;
		case 4 : 
			this.user_lv_img = "/resources/user_lv/vvip.png";
			break;
		default : 
			this.user_lv_img = null;
			break;
		}
	}
}
