package com.project.pt.login.vo;

public class LoginVO {
<<<<<<< HEAD
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
=======
	String id;
	String pw;
	String role;
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
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", pw=" + pw + ", role=" + role + "]";
>>>>>>> refs/remotes/origin/양효진
	}
}
