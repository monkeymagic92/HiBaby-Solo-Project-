package com.jy.hibaby.user.model;

public class UserVO {
	private int i_user;
	private String user_id;
	private String user_pw;
	private String salt;
	private String nm;
	private String nick;
	private String email;
	private int uNum;	// 비밀번호 변경시 고유번호 8자리
	private String myPoint; // 누적포인트	
	private String myCash; // 환불받은 금액
	private String sm; // 상태메세지
	private String profile_img;
	private String r_dt;
	private String m_dt;
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getMyPoint() {
		return myPoint;
	}
	public void setMyPoint(String myPoint) {
		this.myPoint = myPoint;
	}
	public String getMyCash() {
		return myCash;
	}
	public void setMyCash(String myCash) {
		this.myCash = myCash;
	}
	public String getSm() {
		return sm;
	}
	public void setSm(String sm) {
		this.sm = sm;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	
	
		
}
