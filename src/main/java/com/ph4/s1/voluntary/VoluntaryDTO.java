package com.ph4.s1.voluntary;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.ph4.s1.voluntary.file.VoluntaryFileDTO;

@Component
public class VoluntaryDTO {

	private long num;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	private long hit;
	private VoluntaryFileDTO voluntaryFileDTO;
	
	
	public VoluntaryFileDTO getVoluntaryFileDTO() {
		return voluntaryFileDTO;
	}
	public void setVoluntaryFileDTO(VoluntaryFileDTO voluntaryFileDTO) {
		this.voluntaryFileDTO = voluntaryFileDTO;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	
	
}
