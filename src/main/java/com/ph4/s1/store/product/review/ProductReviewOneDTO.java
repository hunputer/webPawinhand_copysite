package com.ph4.s1.store.product.review;

import org.springframework.stereotype.Component;

@Component
public class ProductReviewOneDTO {
	
	private long review_num;
	private long product_num;
	private String id;
	private int starCount;
	private String contents;
	
	private String name;
	private String color;
	
	private long points;
	
	private String fileName;
	

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public long getPoints() {
		return points;
	}

	public void setPoints(long points) {
		this.points = points;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	

}
