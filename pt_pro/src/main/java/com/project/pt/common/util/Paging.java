package com.project.pt.common.util;

import java.util.ArrayList;
import java.util.List;

public class Paging {

	private int offset;
	private int limit;
	private int currentPageNumber;	
	private int nextPageNumber;
	private int prevPageNumber;
	private List<Integer> pageNumberList;
	private List<Object> pageData;
	private int lastPage;
	private int lastPageMinus;
	

	public Paging(List<Object> datas, int currentPageNumber, int limit) {
		this.offset = limit * (currentPageNumber - 1); //1페이지 0 2페이지 10 3페이지 20 4페이지 30
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
		int page2=datas.size()%10;
		if(page2 == 0) {
			this.lastPage = (datas.size())/10;
		} else {
			this.lastPage = ((datas.size())/10)+1;

		}
		this.lastPageMinus=lastPage-1;
	}
	
	
	public int getLastPage() {
		return lastPage;
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
	
	public boolean hasNextPage() {
		return this.pageNumberList.contains(this.nextPageNumber);
	}
	
	public boolean hasPrevPage() {
		return this.pageNumberList.contains(this.prevPageNumber);
	}
	
}
