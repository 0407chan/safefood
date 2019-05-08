/**
 *
 */
package com.ssafy.model.dto;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */

public class UserInfo {
	private String userId;
	private String name;
	private String password;

	public UserInfo() {
	}

	public UserInfo(String userId, String name, String password) {
		this.userId = userId;
		this.name = name;
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", name=" + name + ", password=" + password + "]";
	}

}
