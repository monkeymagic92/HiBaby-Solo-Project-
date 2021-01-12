package com.jy.hibaby.user.model;

public class UserDMI extends UserVO {
	private int myPoint;
	private int totalPoint;
	private int totalCash;
	private int myCash;
	private int myPointNow;
	
	private int to_user;
	
	
	
	public int getTo_user() {
		return to_user;
	}
	public void setTo_user(int to_user) {
		this.to_user = to_user;
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
