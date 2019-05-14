package com.ssafy.model.dto;

public class getAte {
	private int getatekey;
	private int code;
	private String img;
	private String name;
	private int num;
	private String date;
	
	public getAte(int getatekey, int code, String img, String name, int num, String date) {
		super();
		setGetatekey(getatekey);
		this.code= code;
		this.img = img;
		this.name = name;
		this.num = num;
		this.date = date;
	}
	
	public int getGetatekey() {
		return getatekey;
	}

	public void setGetatekey(int getatekey) {
		this.getatekey = getatekey;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
		builder.append("getAte [getatekey=");
		builder.append(getatekey);
		builder.append(", code=");
		builder.append(code);
		builder.append(", img=");
		builder.append(img);
		builder.append(", name=");
		builder.append(name);
		builder.append(", num=");
		builder.append(num);
		builder.append(", date=");
		builder.append(date);
		builder.append("]");
		return builder.toString();
	}

	
}
