package com.jy.hibaby.board.model;

public class BoardPARAM extends BoardVO{
	private String nick;	// 글쓴이 nick 값 가져옴(BoardDMI 에도 똑같은 값 있음)
	private String profile_img;
	
	private int pageStart;
	private int perPageNum;
	private int cmt_pageStart;
	private int cmt_perPageNum;
	
	private int totalPoint;	// 계급 나타내기위해 BoardPARAM에 넣음( detail.jsp 에서사용 )
	private int myPoint;
	
	
	
	
	
	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	public int getMyPoint() {
		return myPoint;
	}

	public void setMyPoint(int myPoint) {
		this.myPoint = myPoint;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getCmt_pageStart() {
		return cmt_pageStart;
	}

	public void setCmt_pageStart(int cmt_pageStart) {
		this.cmt_pageStart = cmt_pageStart;
	}

	public int getCmt_perPageNum() {
		return cmt_perPageNum;
	}

	public void setCmt_perPageNum(int cmt_perPageNum) {
		this.cmt_perPageNum = cmt_perPageNum;
	}

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
