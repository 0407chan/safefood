package com.ssafy.model.dto;

public class ExpFood {
	private int expkey;
	private int code;
	private int num;
	private String id;
	
	public ExpFood() {
		this(0,0,0,"");
	}
	
	public ExpFood(int expkey, int code, int num, String id) {
		super();
		setExpkey(expkey);
		setCode(code);
		setNum(num);
		setId(id);
	}
	
	public int getExpkey() {
		return expkey;
	}

	public void setExpkey(int expkey) {
		this.expkey = expkey;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ExpFood [expkey=");
		builder.append(expkey);
		builder.append(", code=");
		builder.append(code);
		builder.append(", num=");
		builder.append(num);
		builder.append(", id=");
		builder.append(id);
		builder.append("]");
		return builder.toString();
	}
}
