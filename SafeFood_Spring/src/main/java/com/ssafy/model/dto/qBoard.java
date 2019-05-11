package com.ssafy.model.dto;

public class qBoard {
	private int idx;
	private String content;
	private String userid;
	private String date;
	private boolean state;
	
	public qBoard() {}
	
	public qBoard(int idx, String content, String userid, String date, boolean state) {
		super();
		setIdx(idx);
		setContent(content);
		setUserid(userid);
		setDate(date);
		setState(state);
	}
	
	public boolean getState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("qBoard [idx=");
		builder.append(idx);
		builder.append(", content=");
		builder.append(content);
		builder.append(", userid=");
		builder.append(userid);
		builder.append(", date=");
		builder.append(date);
		builder.append(", state=");
		builder.append(getState());
		builder.append("]");
		return builder.toString();
	}
	
	
}
