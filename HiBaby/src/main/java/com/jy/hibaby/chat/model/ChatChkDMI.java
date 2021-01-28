package com.jy.hibaby.chat.model;

public class ChatChkDMI extends ChatChkVO{

	private String nick;
	private String profile_img;
	private int from_user;
	private int to_user;
	private int to_chk;
	
	
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
	public int getFrom_user() {
		return from_user;
	}
	public void setFrom_user(int from_user) {
		this.from_user = from_user;
	}
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
	}
	public int getTo_chk() {
		return to_chk;
	}
	public void setTo_chk(int to_chk) {
		this.to_chk = to_chk;
	}
	
}
