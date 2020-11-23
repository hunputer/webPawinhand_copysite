package com.ph4.s1.store.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ph4.s1.store.product.ProductDTO;

@Component
public class OrderDetailDTO {
	
	private long num;
	private String id;
	private long order_num;
	private long product_num;
	private String name;
	private long amount;
	private long ptotal;
	
	private ProductDTO productDTO;
	
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(long order_num) {
		this.order_num = order_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public long getPtotal() {
		return ptotal;
	}
	public void setPtotal(long ptotal) {
		this.ptotal = ptotal;
	}
	
	
}
