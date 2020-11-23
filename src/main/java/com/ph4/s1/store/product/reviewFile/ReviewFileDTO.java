package com.ph4.s1.store.product.reviewFile;

import org.springframework.stereotype.Component;

@Component
public class ReviewFileDTO {
	private long reviewFile_num;
	private long review_num;
	private String fileName;
	private String oriName;
	public long getReviewFile_num() {
		return reviewFile_num;
	}
	public void setReviewFile_num(long reviewFile_num) {
		this.reviewFile_num = reviewFile_num;
	}
	public long getReview_num() {
		return review_num;
	}
	public void setReview_num(long review_num) {
		this.review_num = review_num;
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
