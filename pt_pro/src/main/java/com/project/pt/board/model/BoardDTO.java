package com.project.pt.board.model;

public class BoardDTO {
	private String writer; 
	private String title; 
	private String file_name; 
	private String category;  
	private String contents; 
	private String btrainer;
	private char deleted; 
	private int dataNum;
	private int usersCode;
	private int conut; 
	private int recommend;
	private int rn;
	private int liked;
	private String writedate;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getBtrainer() {
		return btrainer;
	}
	public void setBtrainer(String btrainer) {
		this.btrainer = btrainer;
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
	public int getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(int usersCode) {
		this.usersCode = usersCode;
	}
	public int getConut() {
		return conut;
	}
	public void setConut(int conut) {
		this.conut = conut;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
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
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "BoardDTO [writer=" + writer + ", title=" + title + ", file_name=" + file_name + ", category=" + category
				+ ", contents=" + contents + ", btrainer=" + btrainer + ", deleted=" + deleted + ", dataNum=" + dataNum
				+ ", usersCode=" + usersCode + ", conut=" + conut + ", recommend=" + recommend + ", rn=" + rn
				+ ", liked=" + liked + ", writedate=" + writedate + "]";
	}
	
	
	
	
	
	
}
