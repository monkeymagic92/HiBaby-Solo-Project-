package com.jy.hibaby.chat.model;

public class ChatPARAM extends ChatVO {
	
	private String from_profile_img;	
	private String to_profile_img;		
	private String to_nick;			    
	private String from_nick;
	private String nick;
	private String profile_img;
	
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getFrom_nick() {
		return from_nick;
	}
	public void setFrom_nick(String from_nick) {
		this.from_nick = from_nick;
	}
	public String getTo_nick() {
		return to_nick;
	}
	public void setTo_nick(String to_nick) {
		this.to_nick = to_nick;
	}
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
