package com.ph4.s1.store.product.productDetail;

import org.springframework.stereotype.Component;

@Component
public class ProductDetailDTO {
	private long productDetail_num;
	private long product_num;
	private String fileName;
	private String oriName;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getProductDetail_num() {
		return productDetail_num;
	}
	public void setProductDetail_num(long productDetail_num) {
		this.productDetail_num = productDetail_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
}
