package com.four.myapp.domain;

import java.sql.Date;

public class ReadVO {
	private int  topic_type , debate_tot_pro, debate_tot_con, debate_tot_neut, topic_no, vote_type, user_no, op_no;
	private Date debate_endate;
	private String topic_title,topic_short_cont,topic_long_cont,topic_pro,topic_con, user_nick;
	
	
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
	public int getVote_type() {
		return vote_type;
	}
	public void setVote_type(int vote_type) {
		this.vote_type = vote_type;
	}
	public int getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(int topic_no) {
		this.topic_no = topic_no;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public int getTopic_type() {
		return topic_type;
	}
	public void setTopic_type(int topic_type) {
		this.topic_type = topic_type;
	}
	
	public int getDebate_tot_pro() {
		return debate_tot_pro;
	}
	public void setDebate_tot_pro(int debate_tot_pro) {
		this.debate_tot_pro = debate_tot_pro;
	}
	public int getDebate_tot_con() {
		return debate_tot_con;
	}
	public void setDebate_tot_con(int debate_tot_con) {
		this.debate_tot_con = debate_tot_con;
	}
	public int getDebate_tot_neut() {
		return debate_tot_neut;
	}
	public void setDebate_tot_neut(int debate_tot_neut) {
		this.debate_tot_neut = debate_tot_neut;
	}
	public Date getDebate_endate() {
		return debate_endate;
	}
	public void setDebate_endate(Date debate_endate) {
		this.debate_endate = debate_endate;
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
	public String getTopic_long_cont() {
		return topic_long_cont;
	}
	public void setTopic_long_cont(String topic_long_cont) {
		this.topic_long_cont = topic_long_cont;
	}
	public String getTopic_pro() {
		return topic_pro;
	}
	public void setTopic_pro(String topic_pro) {
		this.topic_pro = topic_pro;
	}
	public String getTopic_con() {
		return topic_con;
	}
	public void setTopic_con(String topic_con) {
		this.topic_con = topic_con;
	}
	
	
	
}