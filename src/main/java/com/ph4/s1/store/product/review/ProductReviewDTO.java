package com.ph4.s1.store.product.review;

import com.ph4.s1.store.product.ProductDTO;

public class ProductReviewDTO {
	
	private long review_num;
	private long product_num;
	private String id;
	private int starCount;
	private String contents;
	private String fileName;
	
	private ProductDTO productDTO;
	
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getReview_num() {
		return review_num;
	}
	public void setReview_num(long review_num) {
		this.review_num = review_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public int getStarCount() {
		return starCount;
	}
	public void setStarCount(int starCount) {
		this.starCount = starCount;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}
