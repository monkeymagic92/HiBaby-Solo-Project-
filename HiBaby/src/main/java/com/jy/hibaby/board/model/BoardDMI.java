package com.jy.hibaby.board.model;

import java.util.List;

public class BoardDMI extends BoardVO{
	private String nick;
	private int seq;	// 사진 포문돌릴 seq
	private String imageFile;	 
	private List<BoardVO> imageFileList; 
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public List<BoardVO> getImageFileList() {
		return imageFileList;
	}

	public void setImageFileList(List<BoardVO> imageFileList) {
		this.imageFileList = imageFileList;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}
