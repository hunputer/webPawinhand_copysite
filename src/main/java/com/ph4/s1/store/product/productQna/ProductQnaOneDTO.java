package com.ph4.s1.store.product.productQna;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component
public class ProductQnaOneDTO {
	
	private long qna_num;
	private long product_num;
	private String id;
	private String contents;
	private String title;
	private Date regDate;
	
	private String name;
	private String color;
	
	private long qnaReply_num;
	private long qna_num_1;
	private String id_1;
	private String contents_1;
	private Date regDate_1;
	
	
	
	public long getQna_num() {
		return qna_num;
	}
	public void setQna_num(long qna_num) {
		this.qna_num = qna_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public long getQnaReply_num() {
		return qnaReply_num;
	}
	public void setQnaReply_num(long qnaReply_num) {
		this.qnaReply_num = qnaReply_num;
	}
	public long getQna_num_1() {
		return qna_num_1;
	}
	public void setQna_num_1(long qna_num_1) {
		this.qna_num_1 = qna_num_1;
	}
	public String getId_1() {
		return id_1;
	}
	public void setId_1(String id_1) {
		this.id_1 = id_1;
	}
	public String getContents_1() {
		return contents_1;
	}
	public void setContents_1(String contents_1) {
		this.contents_1 = contents_1;
	}
	public Date getRegDate_1() {
		return regDate_1;
	}
	public void setRegDate_1(Date regDate_1) {
		this.regDate_1 = regDate_1;
	}
	
	
	
	

}
