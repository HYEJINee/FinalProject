package com.four.myapp.domain;

public class MypageDto {
	private String user_no;
	private String topic_no;
	private String timeline_type;
	private String timeline_statement;
	private String timeline_date;
	private String vote_type;
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
	public String getTimeline_type() {
		return timeline_type;
	}
	public void setTimeline_type(String vote_type, String timeline_type) {
		this.timeline_type = timeline_type;
		//setTimeline_statement(vote_type, timeline_type);
	}
	/*
	public String setVote_statement(String vote_type) {
		String vote_statement;
		switch (vote_type) {
		case "0" : return vote_statement = "����";
		case "1" : return vote_statement = "�ݴ�";
		case "2" : return vote_statement = "����";
		default : return vote_statement = null;
		}
	}
	public void setTimeline_statement(String vote_type, String timeline_type) {
		String vote_statement = setVote_statement(vote_type);
		switch (timeline_type) {
		case "0" : timeline_statement = "�Ȱ��� �����߽��ϴ�.";
			break;
		case "1" : timeline_statement = "�Ȱ��� ��� ������ ���� ��õ�� �ް��ֽ��ϴ�.";
			break;
		case "2" : timeline_statement = "�Ȱ��� ��� ������ �����Ͽ� �����߽��ϴ�.";
			break;
		case "3" : timeline_statement = "�Ȱ��� ������Դϴ�.";
			break;
		case "4" : timeline_statement = "�Ȱ��� ����� �����Ͽ����ϴ�.";
			break;
		case "5" : timeline_statement = "�Ȱ��� ��õ �Ͽ����ϴ�.";
			break;
		case "6" : timeline_statement = "�Ȱǿ� <strong>" + vote_statement + "</strong> ��ǥ�� �Ͽ����ϴ�.";
			break;
		case "7" : timeline_statement = "�Ȱǿ� <strong>"  + vote_statement + "</strong> �ǰ��� ������ϴ�.";
			break;
		default : timeline_statement = null;
			break;
		}
	}
	*/
	public String getTimeline_date() {
		return timeline_date;
	}
	public void setTimeline_date(String timeline_date) {
		this.timeline_date = timeline_date;
	}
	public String getVote_type() {
		return vote_type;
	}
	public void setVote_type(String vote_type) {
		this.vote_type = vote_type;
	}
	
	
}
