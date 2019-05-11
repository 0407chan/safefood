package com.ssafy.model.dto;

public class Board {
	private int idx;
	private String title;
	private String content;
	private String create_id;
	
	public Board() {}
	public Board(String title, String content,String create_id) {
		setTitle(title);
		setContent(content);
		setCreate_id(create_id);
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreate_id() {
		return create_id;
	}
	public void setCreate_id(String create_id) {
		this.create_id = create_id;
	}
	@Override
	public String toString() {
		return "Board [idx="+idx+",title="+title+",content="+content+",create_id="+create_id+"]";
	}
	
}
