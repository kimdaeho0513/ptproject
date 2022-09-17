package com.project.pt.login.vo;

public class LoginVO {
	private String userid;
	private String pw;
	private String roles;
	public String getUserid() {
		return userid;
	}
	public void setId(String userid) {
		this.userid = userid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRoles() {
		return roles;
	}
	public void setRole(String roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "LoginVO [userid=" + userid + ", pw=" + pw + ", roles=" + roles + "]";
	}
}
