package com.ph4.s1.store.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.product.ProductDAO.";
	
	public ProductDTO getOne(ProductDTO productDTO) {
		return sqlSession.selectOne(NAMESPACE+"getOne", productDTO);
	}
	
	public List<ProductDTO> getList(ProductDTO productDTO){
		return sqlSession.selectList(NAMESPACE+"getList",productDTO);
	}
	
	public int setInsert(ProductDTO productDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", productDTO);
	}
	
	public int setDelete(ProductDTO productDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", productDTO);
	}
	
	public int setUpdate(ProductDTO productDTO) {
		return sqlSession.update(NAMESPACE+"setUpdate", productDTO);
	}
	
	
	
	public List<ProductDTO> getList_admin(ProductPager productPager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList_admin", productPager);
	}
	
	public long getCount(ProductPager productPager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", productPager);
	}
	
	public int setUpdate_admin(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdate_admin", productDTO);
	}
	
	


	
}
