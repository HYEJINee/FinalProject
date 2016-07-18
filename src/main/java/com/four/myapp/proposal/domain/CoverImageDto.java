package com.four.myapp.proposal.domain;

public class CoverImageDto {
	private int topic_no;
	private String img_file_name;
	private String img_regdate;
	
	public int getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(int topic_no) {
		this.topic_no = topic_no;
	}
	public String getImg_file_name() {
		return img_file_name;
	}
	public void setImg_file_name(String img_file_name) {
		this.img_file_name = img_file_name;
	}
	public String getImg_regdate() {
		return img_regdate;
	}
	public void setImg_regdate(String img_regdate) {
		this.img_regdate = img_regdate;
	}
}
