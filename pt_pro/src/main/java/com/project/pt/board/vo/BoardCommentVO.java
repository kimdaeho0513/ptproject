package com.project.pt.board.vo;

import java.sql.Date;

public class BoardCommentVO { 

 

	private int commentNum;
	private int dateNum;
	private String commentContents;
	private String commentWriter;
	private String deleted;
	private String hidden;

	
	
	
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
	@Override
	public String toString() {
		return "BoardCommentVO [commentNum=" + commentNum + ", dateNum=" + dateNum + ", commentContents="
				+ commentContents + ", commentWriter=" + commentWriter + ", deleted=" + deleted + ", hidden=" + hidden
				+ "]";
	}

	


}
