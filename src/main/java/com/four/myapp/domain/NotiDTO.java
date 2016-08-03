package com.four.myapp.domain;

public class NotiDTO {
	private String noti_no;
	private int user_no;
	private int topic_no;
	private String topic_title;
	private int other_user_no;
	private String other_user_nick;
	private String noti_type;
	private String noti_statement;
	private String noti_date;
	private String not_check;
	private String noti_css;
	
	
	public String getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(String noti_no) {
		this.noti_no = noti_no;
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
	public String getTopic_title() {
		return topic_title;
	}
	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}	
	public int getOther_user_no() {
		return other_user_no;
	}
	public void setOther_user_no(int other_user_no) {
		this.other_user_no = other_user_no;
	}
	public String getOther_user_nick() {
		return other_user_nick;
	}
	public void setOther_user_nick(String other_user_nick) {
		this.other_user_nick = other_user_nick;
	}
	public String getNoti_type() {
		return noti_type;
	}
	public void setNoti_type(String noti_type) {
		this.noti_type = noti_type;
		setNoti_statement(noti_type);
	}
	public String getNoti_statement() {
		return noti_statement;
	}
	public void setNoti_statement(String noti_type) {
		switch (noti_type) {
		case "0" : 
			this.noti_css = "reply";
			this.noti_statement = "의 내 의견에 답글을 달았습니다.";
			break;
		case "1" : 
			this.noti_css = "topic";
			this.noti_statement = " 안건이 토론 상정을 위해 추천을 받고있습니다.";
			break;
		case "2" : 
			this.noti_css = "topic";
			this.noti_statement = " 안건이 토론 상정에 실패하여 종료했습니다.";
			break;
		case "3" : 
			this.noti_css = "topic";
			this.noti_statement = " 안건이 토론중이 되었습니다.";
			break;
		case "4" : 
			this.noti_css = "topic";
			this.noti_statement = " 안건이 토론을 종료하였습니다.";
			break;
		default : 
			this.noti_css = "topic";
			this.noti_statement = null;
			break;
		}
	}
	public String getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(String noti_date) {
		this.noti_date = noti_date;
	}
	public String getNot_check() {
		return not_check;
	}
	public void setNot_check(String not_check) {
		this.not_check = not_check;
	}
	public String getNoti_css() {
		return noti_css;
	}	
	
}
