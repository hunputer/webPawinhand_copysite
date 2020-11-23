package com.ph4.s1.store.product.productQna;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.ph4.s1.store.product.ProductDTO;
import com.ph4.s1.store.product.productQnaReply.ProductQnaReplyDTO;

@Component
public class ProductQnaDTO {
	private long qna_num;
	private long product_num;
	private String id;
	private String contents;
	private String title;
	private Date regDate;
	private ProductQnaReplyDTO productQnaReplyDTO;
	private ProductDTO productDTO;
	
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	
	
	public ProductQnaReplyDTO getProductQnaReplyDTO() {
		return productQnaReplyDTO;
	}
	public void setProductQnaReplyDTO(ProductQnaReplyDTO productQnaReplyDTO) {
		this.productQnaReplyDTO = productQnaReplyDTO;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public long getQna_num() {
		return qna_num;
	}
	public void setQna_num(long qna_num) {
		this.qna_num = qna_num;
	}
	public long getProduct_num() {
		return product_num;
	}
	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
