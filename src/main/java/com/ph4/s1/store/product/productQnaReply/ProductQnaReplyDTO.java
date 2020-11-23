package com.ph4.s1.store.product.productQnaReply;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ProductQnaReplyDTO {
	
	private long qnaReply_num;
	private long qna_num;
	private String id;
	private String contents;
	private Date regDate;
	public long getQnaReply_num() {
		return qnaReply_num;
	}
	public void setQnaReply_num(long qnaReply_num) {
		this.qnaReply_num = qnaReply_num;
	}
	public long getQna_num() {
		return qna_num;
	}
	public void setQna_num(long qna_num) {
		this.qna_num = qna_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
}
