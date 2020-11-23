package com.ph4.s1.store.product.reviewFile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.store.product.review.ProductReviewDTO;

@Repository
public class ReviewFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.product.reviewFile.ReviewFileDAO.";
	
	public ReviewFileDTO getFile(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getFile", productReviewDTO);
	}
	
	public int setInsert(ReviewFileDTO reviewFileDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", reviewFileDTO);
	}
	
}
