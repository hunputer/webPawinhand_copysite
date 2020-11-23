package com.ph4.s1.voluntary.reserve;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class VoluntaryReserveDTO {

	private long resNum;
	private long num;
	private String resDate;
	private String startTime;
	private String endTime;
	private String id;
	
	//jsp에서 쓸 변수
	private int year;
	private int month;
	private int date;
	
	
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public long getResNum() {
		return resNum;
	}
	public void setResNum(long resNum) {
		this.resNum = resNum;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
