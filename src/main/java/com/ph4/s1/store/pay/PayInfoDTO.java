package com.ph4.s1.store.pay;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PayInfoDTO {

	private long order_num;
	private String id;
	private String payMethod;
	private long totalPrice;
	private long isPay;
	private Date payDate;
	private Date endDate;
	
	
	public long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public long getIsPay() {
		return isPay;
	}
	public void setIsPay(long isPay) {
		this.isPay = isPay;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
}
