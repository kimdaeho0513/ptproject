package com.project.pt.pay.model;

public class PayDTO {
	private int mem_num;
	private int mem_user;
	private int mem_count;
	private int mem_pt;
	
	
	public int getMem_num() {
		return mem_num;
	}
	
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
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

	public int getMem_pt() {
		return mem_pt;
	}

	public void setMem_pt(int mem_pt) {
		this.mem_pt = mem_pt;
	}

	@Override
	public String toString() {
		return "PayDTO [mem_num=" + mem_num + ", mem_user=" + mem_user + ", mem_count=" + mem_count + ", mem_pt="
				+ mem_pt + "]";
	}
	
	
	
	
	
	

}
