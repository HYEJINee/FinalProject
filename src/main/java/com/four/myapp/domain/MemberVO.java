package com.four.myapp.domain;

import java.util.Date;

public class MemberVO {

	private String user_no;
	private String user_email;
	private String user_pw;
	private String user_nick;
	private String user_lv;
	private String user_profile;
	
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_lv() {
		return user_lv;
	}
	public void setUser_lv(String user_lv) {
		this.user_lv = user_lv;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", user_email=" + user_email + ", user_pw=" + user_pw + ", user_nick="
				+ user_nick + ", user_lv=" + user_lv + ", user_profile=" + user_profile + "]";
	}
	
	
}

