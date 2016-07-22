package com.four.myapp.domain;

public class ProposalRefDTO {
	private int topic_no;
	private String topic_resource_title;
	private String topic_resource_link;
	
	public ProposalRefDTO() {
	}
	
	public ProposalRefDTO(int topic_no, String topic_resource_title, String topic_resource_link) {
		this.topic_no = topic_no;
		this.topic_resource_title = topic_resource_title;
		this.topic_resource_link = topic_resource_link;
	}
	
	public int getTopic_no() {
		return topic_no;
	}
	public void setTopic_no(int topic_no) {
		this.topic_no = topic_no;
	}
	public String getTopic_resource_title() {
		return topic_resource_title;
	}
	public void setTopic_resource_title(String topic_resource_title) {
		this.topic_resource_title = topic_resource_title;
	}
	public String getTopic_resource_link() {
		return topic_resource_link;
	}
	public void setTopic_resource_link(String topic_resource_link) {
		this.topic_resource_link = topic_resource_link;
	}
}
