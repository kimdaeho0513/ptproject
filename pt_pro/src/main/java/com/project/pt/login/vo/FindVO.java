package com.project.pt.login.vo;

public class FindVO {
	private String name;
	private String phone;
	private String email;
	private String userid;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "FindVO [name=" + name + ", phone=" + phone + ", email=" + email + ", userid=" + userid + "]";
	}
}
