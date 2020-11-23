package com.ph4.s1.store.product.productDetail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDetailDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.product.productDetail.ProductDetailDAO.";
	
	public List<ProductDetailDTO> getList(ProductDetailDTO productDetailDTO){
		return sqlSession.selectList(NAMESPACE+"getList", productDetailDTO);
	}
	
	public int setInsert(ProductDetailDTO productDetailDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", productDetailDTO);
	}
	
	public int setDelete(ProductDetailDTO productDetailDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", productDetailDTO);
	}
	
}
