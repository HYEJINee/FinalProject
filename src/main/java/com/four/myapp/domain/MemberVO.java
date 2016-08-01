package com.four.myapp.domain;

import java.util.Date;

public class MemberVO {

	private String user_no;
	private String user_email;
	private String user_pw;
	private String user_nick;
	private String user_lv;
	private String user_check;

	private String profile_file_name;
	private String profile_ext_name;
	
	private String profile;
	private String user_lv_img;

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
		setUser_lv_img(user_lv);
	}

	public String getUser_check() {
		return user_check;
	}

	public void setUser_check(String user_check) {
		this.user_check = user_check;
	}

	public String getProfile_file_name() {
		return profile_file_name;
	}

	public void setProfile_file_name(String profile_file_name) {
		this.profile_file_name = profile_file_name;
	}

	public String getProfile_ext_name() {
		return profile_ext_name;
	}

	public void setProfile_ext_name(String profile_ext_name) {
		this.profile_ext_name = profile_ext_name;
		setProfile(profile_ext_name, profile_ext_name);
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile_file_name, String profile_ext_name ) {
		this.profile = "/resources/mypage/img/" + this.profile_file_name + "." + profile_ext_name;
	}

	public String getUser_lv_img() {
		return user_lv_img;
	}

	public void setUser_lv_img(String user_lv) {
		switch (user_lv) {
		case "0" : 
			this.user_lv_img = "/resources/user_lv/common.png";
			break;
		case "1" : 
			this.user_lv_img = "/resources/user_lv/prestige.png";
			break;
		case "2" : 
			this.user_lv_img = "/resources/user_lv/royal.png";
			break;
		case "3" : 
			this.user_lv_img = "/resources/user_lv/vip.png";
			break;
		case "4" : 
			this.user_lv_img = "/resources/user_lv/vvip.png";
			break;
		default : 
			this.user_lv_img = null;
			break;
		}
		this.user_lv_img = user_lv_img;
	}
	
	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", user_email=" + user_email + ", user_pw=" + user_pw + ", user_nick="
				+ user_nick + ", user_lv=" + user_lv + ", user_check=" + user_check + ", profile_file_name=" + profile_file_name + "]";
	}


}
