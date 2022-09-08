package com.project.pt.pay.vo;

public class PayVO {
	private int mem_num;
	private int mem_count;
	
	
	public int getMem_num() {
		return mem_num;
	}
	
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	public int getMem_count() {
		return mem_count;
	}
	
	public void setMem_count(int mem_count) {
		this.mem_count = mem_count;
	}

	@Override
	public String toString() {
		return "PayVO [mem_num=" + mem_num + ", mem_count=" + mem_count + "]";
	}
	
	
	
}
