package com.four.myapp.domain;

import java.sql.Date;

public class ReadVO {
	private int topic_no, user_no, debate_pro, debate_con, debate_neut, op_no, votecount;
	private Date debate_endate;
	private String topic_type, topic_title, topic_short_cont, topic_long_cont,  topic_pro,  topic_con, topic_resource_link, topic_resource_title;
	private String op_content, user_nick;
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
	public int getOp_no() {
		return op_no;
	}
	public void setOp_no(int op_no) {
		this.op_no = op_no;
	}
	
	
	public int getVotecount() {
		return votecount;
	}
	public void setVotecount(int votecount) {
		this.votecount = votecount;
	}
	public Date getDebate_endate() {
		return debate_endate;
	}
	public void setDebate_endate(Date debate_endate) {
		this.debate_endate = debate_endate;
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
	public String getTopic_resource_link() {
		return topic_resource_link;
	}
	public void setTopic_resource_link(String topic_resource_link) {
		this.topic_resource_link = topic_resource_link;
	}
	public String getTopic_resource_title() {
		return topic_resource_title;
	}
	public void setTopic_resource_title(String topic_resource_title) {
		this.topic_resource_title = topic_resource_title;
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
	
	
}
