package com.project.pt.pay.vo;

public class PayVO {
	private int mem_user;
	private int mem_count;
	
	public int getMem_user() {
		return mem_user;
	}
	public void setMem_user(int mem_user) {
		this.mem_user = mem_user;
	}
	public int getMem_count() {
		return mem_count;
	}
	public void setMem_count(int mem_count) {
		this.mem_count = mem_count;
	}
	@Override
	public String toString() {
		return "PayVO [mem_user=" + mem_user + ", mem_count=" + mem_count + "]";
	}
	
	
	
}
