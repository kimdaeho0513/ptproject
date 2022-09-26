package com.project.pt.mypage.model;

import java.sql.Date;

public class MypageDTO {

	private int userscode;
	private String userid;
	private String pw;
	private String name;
	private Date birth;
	private String phone;
	private String email;
	private String gender;
	private String roles;
	private String hidden;
	private String deleted;
	private Date datelog;
	private Date deletedate;
	
	public int getUserscode() {
		return userscode;
	}

	public void setUserscode(int userscode) {
		this.userscode = userscode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
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

	public Date getDatelog() {
		return datelog;
	}

	public void setDatelog(Date datelog) {
		this.datelog = datelog;
	}

	public Date getDeletedate() {
		return deletedate;
	}

	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}

	@Override
	public String toString() {
		return "MypageDTO [userscode=" + userscode + ", userid=" + userid + ", pw=" + pw + ", name=" + name + ", birth="
				+ birth + ", phone=" + phone + ", email=" + email + ", gender=" + gender + ", roles=" + roles
				+ ", hidden=" + hidden + ", deleted=" + deleted + ", datelog=" + datelog + ", deletedate=" + deletedate
				+ "]";
	}
	


}
