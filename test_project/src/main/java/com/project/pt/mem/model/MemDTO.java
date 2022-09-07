package com.project.pt.mem.model;

import java.util.Date;

public class MemDTO {
	int num;
	String id;
	String pw;
	String name;
	Date birth;
	String phone;
	String email;
	String gender;
	String role;
	String hidden;
	String deleted;
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
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	@Override
	public String toString() {
		return "MemDTO [num=" + num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", phone="
				+ phone + ", email=" + email + ", gender=" + gender + ", role=" + role + ", hidden=" + hidden
				+ ", deleted=" + deleted + "]";
	}
}
