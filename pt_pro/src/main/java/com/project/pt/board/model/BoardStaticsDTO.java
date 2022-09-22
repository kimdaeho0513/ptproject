package com.project.pt.board.model;

import java.sql.Date;

public class BoardStaticsDTO {

	private int commentNum;
	private int dateNum;
	private String commentContents;
	private String commentWriter;
	private String deleted;
	private String hidden;
	private Date commentDate;
	
	
	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getDateNum() {
		return dateNum;
	}
	public void setDateNum(int dateNum) {
		this.dateNum = dateNum;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
	@Override
	public String toString() {
		return "BoardStaticsDTO [commentNum=" + commentNum + ", dateNum=" + dateNum + ", commentContents="
				+ commentContents + ", commentWriter=" + commentWriter + ", deleted=" + deleted + ", hidden=" + hidden
				+ ", commentDate=" + commentDate + "]";
	}

}