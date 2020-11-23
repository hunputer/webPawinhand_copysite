package com.ph4.s1.store.pay;

import org.springframework.stereotype.Component;

@Component
public class DepositInfoDTO {
	
	private long order_num;
	private String depositName;
	private String depositAccount;
	
	public long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}
	public String getDepositName() {
		return depositName;
	}
	public void setDepositName(String depositName) {
		this.depositName = depositName;
	}
	public String getDepositAccount() {
		return depositAccount;
	}
	public void setDepositAccount(String depositAccount) {
		this.depositAccount = depositAccount;
	}
	
	
}
