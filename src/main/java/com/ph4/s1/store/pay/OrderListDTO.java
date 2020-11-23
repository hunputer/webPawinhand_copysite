package com.ph4.s1.store.pay;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderListDTO {

	private long order_num;
	private String orderId;
	private String toName;
	private String toAddress;
	private long toZipcode;
	private String toPhone;
	private String toTel;
	private Date regDate;
	private  long total;
	private String addComment;
	
	
	public long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public long getToZipcode() {
		return toZipcode;
	}
	public void setToZipcode(long toZipcode) {
		this.toZipcode = toZipcode;
	}
	public String getToPhone() {
		return toPhone;
	}
	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}
	public String getToTel() {
		return toTel;
	}
	public void setToTel(String toTel) {
		this.toTel = toTel;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}

	public String getAddComment() {
		return addComment;
	}
	public void setAddComment(String addComment) {
		this.addComment = addComment;
	}
	
	
	
	
	
}
