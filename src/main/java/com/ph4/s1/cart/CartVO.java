package com.ph4.s1.cart;

import org.springframework.stereotype.Component;

import com.ph4.s1.store.product.ProductDTO;

@Component
public class CartVO {

	private String id;
	private long cartNum;
	private long product_num;
	private long amount;
	private long totalPrice;
	private ProductDTO productDTO;
	
	//자바스크립트에서 쓸 변수
	private double points;
	
	public double getPoints() {
		return points;
	}
	public void setPoints(double points) {
		this.points = points;
	}
	public ProductDTO getProductDTO() {
		return this.productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getCartNum() {
		return cartNum;
	}
	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
	
}
