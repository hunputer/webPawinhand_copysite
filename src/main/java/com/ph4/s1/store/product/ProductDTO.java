package com.ph4.s1.store.product;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ProductDTO {
	private long product_num;
	private long category_num;
	private String name;
	private long price;
	private long stock;
	private String weight;
	private String color;
	private String descriptions;
	private Date regDate;
	private String fileName;
	
    //자바스크립트에서 쓸 변수
    private double points;
    private long amount;
    
    
  public long getAmount() {
    return amount;
  }
  public void setAmount(long amount) {
    this.amount = amount;
  }
  public double getPoints() {
    return points;
   }
  public void setPoints(double points) {
    this.points = points;
  }
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public long getCategory_num() {
		return category_num;
	}
	public void setCategory_num(long category_num) {
		this.category_num = category_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getStock() {
		return stock;
	}
	public void setStock(long stock) {
		this.stock = stock;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
