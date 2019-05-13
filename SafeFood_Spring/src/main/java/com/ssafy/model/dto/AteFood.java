package com.ssafy.model.dto;

public class AteFood {
	private int atekey;
	private int code;
	private int num;
	private String id;
	private String date;
	
	public AteFood() {
		this(0,0,0,"","");
	}
	
	public AteFood(int atekey, int code, int num, String id, String date) {
		super();
		setAtekey(atekey);
		setCode(code);
		setNum(num);
		setId(id);
		setDate(date);
	}
	
	public int getAtekey() {
		return atekey;
	}

	public void setAtekey(int atekey) {
		this.atekey = atekey;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
		builder.append("AteFood [atekey=");
		builder.append(atekey);
		builder.append(", code=");
		builder.append(code);
		builder.append(", num=");
		builder.append(num);
		builder.append(", id=");
		builder.append(id);
		builder.append(", date=");
		builder.append(date);
		builder.append("]");
		return builder.toString();
	}
}
