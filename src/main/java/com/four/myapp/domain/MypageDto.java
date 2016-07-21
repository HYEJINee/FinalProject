package com.four.myapp.domain;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MypageDto {
	private String user_no;
	private String topic_no;
	private String topic_title;
	private String timeline_type;
	private String timeline_statement;
	private String vote_type;
	private String vote_statement;
	private String timeline_date;
	private String timeline_css;
	
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(String topic_no) {
		this.topic_no = topic_no;
	}	
	public String getTopic_title() {
		return topic_title;
	}
	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}
	public String getTimeline_type() {
		return timeline_type;
	}
	public void setTimeline_type(String timeline_type) {
		System.out.println("setTimeline_type called");
		this.timeline_type = timeline_type;
		setTimeline_statement(timeline_type);
	}

	public void setTimeline_statement(String timeline_type) {
		switch (timeline_type) {
		case "0" : 
			this.timeline_css = "topic";
			this.timeline_statement = " 안건을 생성했습니다.";
			break;
		case "1" : 
			this.timeline_css = "topic";
			this.timeline_statement = " 안건이 토론 상정을 위해 추천을 받고있습니다. ";
			break;
		case "2" : 
			this.timeline_css = "topic";
			this.timeline_statement = " 안건이 토론 상정에 실패하여 종료했습니다.";
			break;
		case "3" : 
			this.timeline_css = "topic";
			this.timeline_statement = " 안건이 토론중입니다.";
			break;
		case "4" : 
			this.timeline_css = "topic";
			this.timeline_statement = " 안건이 토론을 종료하였습니다.";
			break;
		case "5" : 
			this.timeline_css = "vote";
			this.timeline_statement = " 안건을 추천 하였습니다.";
			break;
		case "6" : 
			this.timeline_css = "vote";
			this.timeline_statement = " 안건에 <strong>" + vote_statement + "</strong> 투표를 하였습니다.";
			break;
		case "7" : 
			this.timeline_css = "opinion";
			this.timeline_statement = " 안건에 <strong>"  + vote_statement + "</strong> 의견을 남겼습니다.";
			break;
		default : 
			this.timeline_css = "topic";
			this.timeline_statement = null;
			break;
		}
		System.out.println("setTimeline_statement called : " + this.timeline_statement);
	}
	public String getTimeline_statement() {
		return timeline_statement;
	}
	public String getVote_type() {
		return vote_type;
	}
	public void setVote_type(String vote_type) {
		System.out.println("setVote_type called");
		this.vote_type = vote_type;
		setVote_statement(vote_type);
	}
	public void setVote_statement(String vote_type) {
		switch (vote_type) {
		case "0" : this.vote_statement = "찬성";
			break;
		case "1" : this.vote_statement = "반대";
			break;
		case "2" : this.vote_statement = "중재";
			break;
		default : this.vote_statement = null;
			break;
		}
		System.out.println("setVote_statement called : " + this.vote_statement);
	}
	public String getVote_statement() {
		return vote_statement;
	}
	public String getTimeline_date() {
		return timeline_date;
	}
	public void setTimeline_date(String timeline_date) throws ParseException {
		this.timeline_date = timeline_date;
	}
	public String getTimeline_css() {
		return timeline_css;
	}
	
}
