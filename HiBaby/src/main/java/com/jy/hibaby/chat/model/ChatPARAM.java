package com.jy.hibaby.chat.model;

public class ChatPARAM extends ChatVO {
	
	private String from_profile_img;	// 내 사진
	private String to_profile_img;		// 상대 사진
	
	
	
	public String getFrom_profile_img() {
		return from_profile_img;
	}
	public void setFrom_profile_img(String from_profile_img) {
		this.from_profile_img = from_profile_img;
	}
	public String getTo_profile_img() {
		return to_profile_img;
	}
	public void setTo_profile_img(String to_profile_img) {
		this.to_profile_img = to_profile_img;
	}
}
