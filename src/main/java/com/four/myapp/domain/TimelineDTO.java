package com.four.myapp.domain;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimelineDTO {
	private int user_no;
	private int topic_no;
	private int topic_type;
	private String topic_title; //join으로 추가
	private String timeline_type;
	private String timeline_statement; //DTO에서 timeline_type별로 생성
	private String vote_type;
	private String vote_statement; //DTO에서 vote_type별로 생성
	private String timeline_date;
	private String timeline_css; //DTO에서 timeline_type별로 생성
	

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
	public String getTimeline_type() {
		return timeline_type;
	}
	public void setTimeline_type(String timeline_type) {
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
			this.timeline_statement = " 안건이 토론 상정을 위해 추천을 받고있습니다. ";//임시저장을 안하기 때문에 안쓰지만 일단 남겨둠 
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
			System.out.println("timeline_statement vote");
			this.timeline_css = "vote";
			this.timeline_statement = " 안건에 " + this.vote_statement + " 투표를 하였습니다.";
			break;
		case "7" : 
			this.timeline_css = "opinion";
			this.timeline_statement = " 안건에"  + this.vote_statement + "의견을 남겼습니다.";
			break;
		default : 
			this.timeline_css = "topic";
			this.timeline_statement = null;
			break;
		}
	}
	public String getTimeline_statement() {
		return timeline_statement;
	}
	public String getVote_type() {
		return vote_type;
	}
	public void setVote_type(String vote_type) {
		this.vote_type = vote_type;
		setVote_statement(vote_type);
	}
	public void setVote_statement(String vote_type) {
		System.out.println("TimelineDTO vote_type: " + vote_type);
		switch (vote_type) {
		case "0" : 
			this.vote_statement = " <strong>찬성</strong> ";
			break;
		case "1" : 
			this.vote_statement = " <strong>반대</strong> ";
			break;
		case "2" : 
			this.vote_statement = " <strong>중재</strong> ";
			break;
		case "3" : 
			this.vote_statement = " ";
			break;
		default : 
			this.vote_statement = null;
			break;
		}
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
	public int getTopic_type() {
		return topic_type;
	}
	public void setTopic_type(int topic_type) {
		this.topic_type = topic_type;
	}
	public String toString(){
		return "user_no=" + user_no + ", topic_no=" + topic_no + ", topic_type=" + topic_type + ", vote_type=" + vote_type + ", timeline_type=" + timeline_type;
	}
	
}
