package com.project.pt.management.model;

public class ManagementDTO {
	
	private int mngNum;
	private String mngId;
	private String mngPass;
	private String mngName;
	private String mngBirth;
	private String mngPhon;
	private String mngEmail;
	private String mngGender;
	private String mngRole;
	
	public int getMngNum() {
		return mngNum;
	}
	public void setMngNum(int mngNum) {
		this.mngNum = mngNum;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getMngPass() {
		return mngPass;
	}
	public void setMngPass(String mngPass) {
		this.mngPass = mngPass;
	}
	public String getMngName() {
		return mngName;
	}
	public void setMngName(String mngName) {
		this.mngName = mngName;
	}
	public String getMngBirth() {
		return mngBirth;
	}
	public void setMngBirth(String mngBirth) {
		this.mngBirth = mngBirth;
	}
	public String getMngPhon() {
		return mngPhon;
	}
	public void setMngPhon(String mngPhon) {
		this.mngPhon = mngPhon;
	}
	public String getMngEmail() {
		return mngEmail;
	}
	public void setMngEmail(String mngEmail) {
		this.mngEmail = mngEmail;
	}
	public String getMngGender() {
		return mngGender;
	}
	public void setMngGender(String mngGender) {
		this.mngGender = mngGender;
	}
	public String getMngRole() {
		return mngRole;
	}
	public void setMngRole(String mngRole) {
		this.mngRole = mngRole;
	}
	@Override
	public String toString() {
		return "ManagementDTO [mngNum=" + mngNum + ", mngId=" + mngId + ", mngPass=" + mngPass + ", mngName=" + mngName
				+ ", mngBirth=" + mngBirth + ", mngPhon=" + mngPhon + ", mngEmail=" + mngEmail + ", mngGender="
				+ mngGender + ", mngRole=" + mngRole + "]";
	}
	
	
	

	
	
	
}
