package com.project.pt.schedule.model;

import java.sql.Date;

public class ScheDTO {
	private int schedule;
	private Date sch_date;
	private int sch_trnr;
	private int sch_mem;
	private String sch_join;
	private String hidden;
	private String deleted;
	public int getSchedule() {
		return schedule;
	}
	public void setSchedule(int schedule) {
		this.schedule = schedule;
	}
	public Date getSch_date() {
		return sch_date;
	}
	public void setSch_date(Date sch_date) {
		this.sch_date = sch_date;
	}
	public int getSch_trnr() {
		return sch_trnr;
	}
	public void setSch_trnr(int sch_trnr) {
		this.sch_trnr = sch_trnr;
	}
	public int getSch_mem() {
		return sch_mem;
	}
	public void setSch_mem(int sch_mem) {
		this.sch_mem = sch_mem;
	}
	public String getSch_join() {
		return sch_join;
	}
	public void setSch_join(String sch_join) {
		this.sch_join = sch_join;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	@Override
	public String toString() {
		return "ScheDTO [schedule=" + schedule + ", sch_date=" + sch_date + ", sch_trnr=" + sch_trnr + ", sch_mem="
				+ sch_mem + ", sch_join=" + sch_join + ", hidden=" + hidden + ", deleted=" + deleted + "]";
	}
	
	
	
	
	
	

}
