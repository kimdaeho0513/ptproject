package com.project.pt.common.util;

import java.util.Arrays;

public class Serach {

	private String keyword;
	private String type;
	private String[] typeArr;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	public String[] getTypeArr() {
		return typeArr;
	}
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	@Override
	public String toString() {
		return "Serach [keyword=" + keyword + ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
	}
	
	
	
}
