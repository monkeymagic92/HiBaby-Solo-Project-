package com.jy.hibaby.board.model;

public class BoardPARAM extends BoardVO{
	private String nick;	// 글쓴이 nick 값 가져옴(BoardDMI 에도 똑같은 값 있음)

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}
