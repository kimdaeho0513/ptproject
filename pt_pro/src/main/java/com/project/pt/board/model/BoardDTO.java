package com.project.pt.board.model;

public class BoardDTO {
	private String writer; 
	private String title; 
	private String writedate; 
	private String file_name; 
	private String category;  
	private String contents; 
	private char deleted; 
	private int dataNum;
	private int conut; 
	private int recommend;
	private int rn;
	private int liked;
	
	
	
	
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public char getDeleted() {
		return deleted;
	}
	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
	public int getDataNum() {
		return dataNum;
	}
	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}
	public int getConut() {
		return conut;
	}
	public void setConut(int conut) {
		this.conut = conut;
	}
	public int getrecommend() {
		return recommend;
	}
	public void setrecommend(int recommend) {
		this.recommend = recommend;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	@Override
	public String toString() {
		return "BoardDTO [writer=" + writer + ", title=" + title + ", writedate=" + writedate + ", file_name="
				+ file_name + ", category=" + category + ", contents=" + contents + ", deleted=" + deleted
				+ ", dataNum=" + dataNum + ", conut=" + conut + ", recommend=" + recommend + ", rn=" + rn + ", liked="
				+ liked + "]";
	}

	
	
}
