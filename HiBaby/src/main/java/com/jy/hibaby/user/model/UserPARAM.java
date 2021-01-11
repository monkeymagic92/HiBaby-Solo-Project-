package com.jy.hibaby.user.model;

import java.util.List;

public class UserPARAM extends UserVO {
	private int myPoint;
	private int totalPoint;
	private int totalCash;
	private int myCash;
	private int myPointNow;
	
	private String searchNick;	// 유저 검색
	
	private int to_user;	// 친구 추가 할시 상대방 pk 값
	private int to_userChk;
	//private List<UserPARAM> to_userChkList;
	
	
	
		
	
	
	
	public int getTo_userChk() {
		return to_userChk;
	}
	public void setTo_userChk(int to_userChk) {
		this.to_userChk = to_userChk;
	}
	/*
	public List<UserPARAM> getTo_userChkList() {
		return to_userChkList;
	}
	public void setTo_userChkList(List<UserPARAM> to_userChkList) {
		this.to_userChkList = to_userChkList;
	}
	*/
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
	}
	public String getSearchNick() {
		return searchNick;
	}
	public void setSearchNick(String searchNick) {
		this.searchNick = searchNick;
	}
	public int getMyPoint() {
		return myPoint;
	}
	public void setMyPoint(int myPoint) {
		this.myPoint = myPoint;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public int getTotalCash() {
		return totalCash;
	}
	public void setTotalCash(int totalCash) {
		this.totalCash = totalCash;
	}
	public int getMyCash() {
		return myCash;
	}
	public void setMyCash(int myCash) {
		this.myCash = myCash;
	}
	public int getMyPointNow() {
		return myPointNow;
	}
	public void setMyPointNow(int myPointNow) {
		this.myPointNow = myPointNow;
	}
	
	/*
	@Override
	public String toString() {
		return String.format("%s", to_userChkList);
	}
	*/
}
