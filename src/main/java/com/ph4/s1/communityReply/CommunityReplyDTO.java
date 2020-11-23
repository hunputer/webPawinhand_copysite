package com.ph4.s1.communityReply;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class CommunityReplyDTO {
	
	private long num;
	private long cmn_num;
	private String writer;
	private String contents;
	private Date regDate;
	private long ref;
	private long step;
	private long depth;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	
	public long getCmn_num() {
		return cmn_num;
	}
	public void setCmn_num(long cmn_num) {
		this.cmn_num = cmn_num;
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
	public long getRef() {
		return ref;
	}
	public void setRef(long ref) {
		this.ref = ref;
	}
	public long getStep() {
		return step;
	}
	public void setStep(long step) {
		this.step = step;
	}
	public long getDepth() {
		return depth;
	}
	public void setDepth(long depth) {
		this.depth = depth;
	}
	
}
