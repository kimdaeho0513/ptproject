package com.project.pt.schedule.vo;

import java.sql.Date;

public class ScheVO {
	private int id;
	private String title;
	private int coachcode;
	private String writer;
	private int membercode;
	private String content;
	private Date start1;
	private Date end1;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCoachcode() {
		return coachcode;
	}
	public void setCoachcode(int coachcode) {
		this.coachcode = coachcode;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getMembercode() {
		return membercode;
	}
	public void setMembercode(int membercode) {
		this.membercode = membercode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStart1() {
		return start1;
	}
	public void setStart1(Date start1) {
		this.start1 = start1;
	}
	public Date getEnd1() {
		return end1;
	}
	public void setEnd1(Date end1) {
		this.end1 = end1;
	}
	@Override
	public String toString() {
		return "ScheDTO [id=" + id + ", title=" + title + ", coachcode=" + coachcode + ", writer=" + writer
				+ ", membercode=" + membercode + ", content=" + content + ", start1=" + start1 + ", end1=" + end1 + "]";
	}
	
}
