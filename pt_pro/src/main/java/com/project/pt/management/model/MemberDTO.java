package com.project.pt.management.model;

public class MemberDTO {
	
	private int memNum;
	private int memUser;
	private int memCount;
	private int memPt;
	
	
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public int getMemUser() {
		return memUser;
	}
	public void setMemUser(int memUser) {
		this.memUser = memUser;
	}
	public int getMemCount() {
		return memCount;
	}
	public void setMemCount(int memCount) {
		this.memCount = memCount;
	}
	public int getMemPt() {
		return memPt;
	}
	public void setMemPt(int memPt) {
		this.memPt = memPt;
	}
	@Override
	public String toString() {
		return "MemberDTO [memNum=" + memNum + ", memUser=" + memUser + ", memCount=" + memCount + ", memPt=" + memPt
				+ "]";
	}
	
	
	
	
}
