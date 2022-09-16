package com.project.pt.board.model;

import java.sql.Date;

public class BoardStaticsDTO {

	private int dateNum;
	private String userId;
	private String bId;
	private boolean viewed;
	private Date latestViewDate;
	
	
	public int getDateNum() {
		return dateNum;
	}
	public void setDateNum(int dateNum) {
		this.dateNum = dateNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String string) {
		this.bId = string;
	}
	public boolean isViewed() {
		return viewed;
	}
	public void setViewed(boolean viewed) {
		this.viewed = viewed;
	}
	public Date getLatestViewDate() {
		return latestViewDate;
	}
	public void setLatestViewDate(Date latestViewDate) {
		this.latestViewDate = latestViewDate;
	}
	public boolean isLiked() {
		return liked;
	}
	public void setLiked(boolean liked) {
		this.liked = liked;
	}
	private boolean liked;
	
	@Override
	public String toString() {
		return "BoardStaticsDTO [dateNum=" + dateNum + ", userId=" + userId + ", bId=" + bId + ", viewed=" + viewed
				+ ", latestViewDate=" + latestViewDate + ", liked=" + liked + "]";
	}
}
