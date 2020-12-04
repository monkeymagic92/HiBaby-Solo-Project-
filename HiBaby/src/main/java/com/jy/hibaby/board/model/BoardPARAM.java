package com.jy.hibaby.board.model;

public class BoardPARAM extends BoardVO{
	private String nick;	// 글쓴이 nick 값 가져옴(BoardDMI 에도 똑같은 값 있음)
	private String profile_img;
	
	
	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}
