package com.four.myapp.domain;

public class MainDto {
	private int topic_no, user_no;
	private String topic_regdate, topic_endate;
	private String topic_type, topic_title, topic_short_cont, topic_progress;
	private int debate_pro, debate_con, debate_neut;
	
	public int getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(int topic_no) {
		this.topic_no = topic_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getTopic_regdate() {
		return topic_regdate;
	}
	public void setTopic_regdate(String topic_regdate) {
		this.topic_regdate = topic_regdate;
	}
	public String getTopic_endate() {
		return topic_endate;
	}
	public void setTopic_endate(String topic_endate) {
		this.topic_endate = topic_endate;
	}
	public String getTopic_type() {
		return topic_type;
	}
	public void setTopic_type(String topic_type) {
		this.topic_type = topic_type;
	}
	public String getTopic_title() {
		return topic_title;
	}
	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}
	public String getTopic_short_cont() {
		return topic_short_cont;
	}
	public void setTopic_short_cont(String topic_short_cont) {
		this.topic_short_cont = topic_short_cont;
	}
	public String getTopic_progress() {
		return topic_progress;
	}
	public void setTopic_progress(String topic_progress) {
		this.topic_progress = topic_progress;
	}
	public int getDebate_pro() {
		return debate_pro;
	}
	public void setDebate_pro(int debate_pro) {
		this.debate_pro = debate_pro;
	}
	public int getDebate_con() {
		return debate_con;
	}
	public void setDebate_con(int debate_con) {
		this.debate_con = debate_con;
	}
	public int getDebate_neut() {
		return debate_neut;
	}
	public void setDebate_neut(int debate_neut) {
		this.debate_neut = debate_neut;
	}
	
}
