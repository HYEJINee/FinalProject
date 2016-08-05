package com.four.myapp.domain;

public class ReplyDTO {
	private int reply_no;
	private int user_no;
	private String user_nick;
	private String profile_file_name;
	private String profile_ext_name;
	private String user_profile;
	private String user_email;
	private int topic_no;
	private String reply_content;
	private String reply_regdate;
	
	private String user_lv;
	private String user_lv_img;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getProfile_file_name() {
		return profile_file_name;
	}
	public void setProfile_file_name(String profile_file_name) {
		this.profile_file_name = profile_file_name;
	}
	public String getProfile_ext_name() {
		return profile_ext_name;
	}
	public void setProfile_ext_name(String profile_ext_name) {
		this.profile_ext_name = profile_ext_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(int topic_no) {
		this.topic_no = topic_no;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(String reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getUser_lv() {
		return user_lv;
	}

	public void setUser_lv(String user_lv) {
		this.user_lv = user_lv;
		setUser_lv_img(user_lv);
	}
	
	public String getUser_lv_img() {
		return user_lv_img;
	}

	public void setUser_lv_img(String user_lv) {
		switch (user_lv) {
		case "0" : 
			this.user_lv_img = "/resources/user_lv/common.png";
			break;
		case "1" : 
			this.user_lv_img = "/resources/user_lv/prestige.png";
			break;
		case "2" : 
			this.user_lv_img = "/resources/user_lv/royal.png";
			break;
		case "3" : 
			this.user_lv_img = "/resources/user_lv/vip.png";
			break;
		case "4" : 
			this.user_lv_img = "/resources/user_lv/vvip.png";
			break;
		default : 
			this.user_lv_img = null;
			break;
		}
	}
}
