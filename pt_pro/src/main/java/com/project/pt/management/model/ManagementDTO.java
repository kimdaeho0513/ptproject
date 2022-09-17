package com.project.pt.management.model;

import java.sql.Date;

public class ManagementDTO {
	
	private int mngNum;
	private String mngId;
	private String mngPass;
	private String mngName;
	private Date mngBirth;
	private String mngPhone;
	private String mngEmail;
	private String mngGender;
	private String mngRole;
	private String mngHidden;
	private Date mngDeleteDate;
	private String mngDeleted;
	private Date mngLog;
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
	public Date getMngBirth() {
		return mngBirth;
	}
	public void setMngBirth(Date mngBirth) {
		this.mngBirth = mngBirth;
	}
	public String getMngPhone() {
		return mngPhone;
	}
	public void setMngPhone(String mngPhone) {
		this.mngPhone = mngPhone;
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
	public String getMngHidden() {
		return mngHidden;
	}
	public void setMngHidden(String mngHidden) {
		this.mngHidden = mngHidden;
	}
	public Date getMngDeleteDate() {
		return mngDeleteDate;
	}
	public void setMngDeleteDate(Date mngDeleteDate) {
		this.mngDeleteDate = mngDeleteDate;
	}
	public String getMngDeleted() {
		return mngDeleted;
	}
	public void setMngDeleted(String mngDeleted) {
		this.mngDeleted = mngDeleted;
	}
	public Date getMngLog() {
		return mngLog;
	}
	public void setMngLog(Date mngLog) {
		this.mngLog = mngLog;
	}
	@Override
	public String toString() {
		return "ManagementDTO [mngNum=" + mngNum + ", mngId=" + mngId + ", mngPass=" + mngPass + ", mngName=" + mngName
				+ ", mngBirth=" + mngBirth + ", mngPhone=" + mngPhone + ", mngEmail=" + mngEmail + ", mngGender="
				+ mngGender + ", mngRole=" + mngRole + ", mngHidden=" + mngHidden + ", mngDeleteDate=" + mngDeleteDate
				+ ", mngDeleted=" + mngDeleted + ", mngLog=" + mngLog + "]";
	}
	
	
	
	
	
}
