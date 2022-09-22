package com.project.pt.board.vo;


public class BoardVO {
	
	private int dataNum;
	private String title;
	private String content;
	private String category;
	private String keyword;
	private String type;
	private String name;
	private int btrainer;
	private int usersCode;

	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	

	public int getBtrainer() {
		return btrainer;
	}
	public void setBtrainer(int btrainer) {
		this.btrainer = btrainer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDataNum() {
		return dataNum;
	}
	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public int getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(int usersCode) {
		this.usersCode = usersCode;
	}
	@Override
	public String toString() {
		return "BoardVO [dataNum=" + dataNum + ", title=" + title + ", content=" + content + ", category=" + category
				+ ", keyword=" + keyword + ", type=" + type + ", name=" + name + ", btrainer=" + btrainer
				+ ", usersCode=" + usersCode + "]";
	}
	
	

}
