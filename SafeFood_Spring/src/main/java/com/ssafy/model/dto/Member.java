package com.ssafy.model.dto;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String allergy;
	public Member() {}
	
	public Member(String id, String pw, String name, String allergy) {
		setId(id);
		setPw(pw);
		setName(name);
		setAllergy(allergy);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", allergy=" + allergy + "]";
	}
}
