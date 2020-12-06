package com.jy.hibaby.board.model;

import java.util.List;

public class BoardVO {
	private int i_board;
	private String title;
	private String ctnt;
	private String image_1;
	private String image_2;
	private String image_3;
	private String image_4;
	private String image_5;
	private int hits;
	private String r_dt;
	private int i_user;
	private String nm;
	
	private int seq;	// 사진 포문돌릴 seq
	private String imageFile;	 
	private List<BoardVO> imageFileList; 
	
	
	
	
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
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
	public String getImage_1() {
		return image_1;
	}
	public void setImage_1(String image_1) {
		this.image_1 = image_1;
	}
	public String getImage_2() {
		return image_2;
	}
	public void setImage_2(String image_2) {
		this.image_2 = image_2;
	}
	public String getImage_3() {
		return image_3;
	}
	public void setImage_3(String image_3) {
		this.image_3 = image_3;
	}
	public String getImage_4() {
		return image_4;
	}
	public void setImage_4(String image_4) {
		this.image_4 = image_4;
	}
	public String getImage_5() {
		return image_5;
	}
	public void setImage_5(String image_5) {
		this.image_5 = image_5;
	}
	public int getI_board() {
		return i_board;
	}
	public void setI_board(int i_board) {
		this.i_board = i_board;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}	
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	
	
		 
}
