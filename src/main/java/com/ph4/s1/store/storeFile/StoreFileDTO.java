package com.ph4.s1.store.storeFile;

import org.springframework.stereotype.Component;

@Component
public class StoreFileDTO {
	private long file_num;
	private long product_num;
	private String fileName;
	private String oriName;
	public long getFile_num() {
		return file_num;
	}
	public void setFile_num(long file_num) {
		this.file_num = file_num;
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
