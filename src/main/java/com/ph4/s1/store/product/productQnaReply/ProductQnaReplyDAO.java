package com.ph4.s1.store.product.productQnaReply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.store.product.productQna.ProductQnaDTO;

@Repository
public class ProductQnaReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.product.productQnaReply.ProductQnaReplyDAO.";
	
	public ProductQnaReplyDTO getOne(ProductQnaDTO productQnaDTO) {
		return sqlSession.selectOne(NAMESPACE+"getOne", productQnaDTO);
	}
	
	public int setInsert(ProductQnaReplyDTO productQnaReplyDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", productQnaReplyDTO);
	}
	
	public int setDelete(ProductQnaReplyDTO productQnaReplyDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", productQnaReplyDTO);
	}

}
