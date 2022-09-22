package com.project.pt.common.util;

import java.util.ArrayList;
import java.util.List;

public class Paging {

	private int offset;		//기준주소에서 다음페이지로 갈때 추가로 더해진 값
	private int limit;		//~까지
	private int currentPageNumber;  //현재페이지 넘버
	private int nextPageNumber; 	//다음페이지 넘버 
	private int prevPageNumber;		//이전 페이지 넘버
	private List<Integer> pageNumberList;	
	private List<Object> pageData;
	private String keyword;
	
	public Paging(List<Object> datas, int currentPageNumber, int limit) {
		this.offset = limit * (currentPageNumber - 1);
		this.limit = limit;
		this.currentPageNumber = currentPageNumber;
		this.nextPageNumber = currentPageNumber + 1;
		this.prevPageNumber = currentPageNumber - 1;
		int pageNum = 1;
		this.pageNumberList = new ArrayList<Integer>();
		for(int i = 0; i < datas.size(); i += limit) {
			this.pageNumberList.add(pageNum++);
		}
		int max = this.offset + this.limit;
		max = max < datas.size() ? max : datas.size();
		this.pageData = datas.subList(this.offset, max);
	}
	
	
	
	
	public String getkeyword() {
		return keyword;
	}




	public void setkeyword(String keyword) {
		this.keyword = keyword;
	}




	public int getOffset() {
		return offset;
	}
	
	public int getLimit() {
		return limit;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public int getNextPageNumber() {
		return nextPageNumber;
	}
	
	public int getPrevPageNumber() {
		return prevPageNumber;
	}
	
	public List<Integer> getPageNumberList() {
		return pageNumberList;
	}
	
	public List<Integer> getPageNumberList(int start, int end) {
		start = start > 0 ? start : 1;
		end = end < this.pageNumberList.size() ? end : this.pageNumberList.size();
		return pageNumberList.subList(start - 1, end);
	}
	
	public List<Object> getPageData() {
		return pageData;
	}
	

	public Object getPageData(Search search) {
		return pageData;
	}
	
	public boolean hasNextPage() {
		return this.pageNumberList.contains(this.nextPageNumber);
	}
	
	public boolean hasPrevPage() {
		return this.pageNumberList.contains(this.prevPageNumber);
	}




	@Override
	public String toString() {
		return "Paging [offset=" + offset + ", limit=" + limit + ", currentPageNumber=" + currentPageNumber
				+ ", nextPageNumber=" + nextPageNumber + ", prevPageNumber=" + prevPageNumber + ", pageNumberList="
				+ pageNumberList + ", pageData=" + pageData + ", keyword=" + keyword + "]";
	}




	
		
}
