package com.ph4.s1.store.product.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.util.Pager;

@Repository
public class ProductReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.product.review.ProductReviewDAO.";
	
	public List<ProductReviewDTO> getList(ReviewPager reviewPager){
		return sqlSession.selectList(NAMESPACE+"getList", reviewPager);
	}
	
	public int setInsert(ProductReviewDTO productReviewDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", productReviewDTO);
	}
	
	public int setDelete(ProductReviewDTO productReviewDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", productReviewDTO);
	}
	
	public long getCount(ReviewPager reviewPager) {
		return sqlSession.selectOne(NAMESPACE+"getCount", reviewPager);
	}
	
	//----------------------admin--------------------------------------------------
	
	public List<ProductReviewDTO> getReviewList_admin(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getReviewList_admin", pager);
	}
	
	public long getCount_admin(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount_admin", pager);
	}
	
	public ProductReviewOneDTO getReviewOne_admin(ProductReviewOneDTO productReviewOneDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getReviewOne_admin", productReviewOneDTO);
	}
}
