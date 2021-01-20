package com.jy.hibaby.chat.model;

public class ChatVO {
	private int i_chat;
	private int to_user;
	private int from_user;
	private String ctnt;
	private String r_dt;
	
	public int getI_chat() {
		return i_chat;
	}
	public void setI_chat(int i_chat) {
		this.i_chat = i_chat;
	}
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
	}
	public int getFrom_user() {
		return from_user;
	}
	public void setFrom_user(int from_user) {
		this.from_user = from_user;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
}
