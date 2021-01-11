package com.jy.hibaby.user.model;

public class UserPARAM extends UserVO {
	private int myPoint;
	private int totalPoint;
	private int totalCash;
	private int myCash;
	private int myPointNow;
	
	private String searchNick;	// 유저 검색
	
	
	
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
}
