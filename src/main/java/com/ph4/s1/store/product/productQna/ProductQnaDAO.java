package com.ph4.s1.store.product.productQna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.util.Pager;

@Repository
public class ProductQnaDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.product.productQna.ProductQnaDAO.";
	
	public List<ProductQnaDTO> getList(QnaPager qnaPager){
		return sqlSession.selectList(NAMESPACE+"getList", qnaPager);
	}
	
	public long getCount(QnaPager qnaPager) {
		return sqlSession.selectOne(NAMESPACE+"getCount", qnaPager);
	}
	
	public int setInsert(ProductQnaDTO productQnaDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", productQnaDTO);
	}
	
	public int setDelete(ProductQnaDTO productQnaDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", productQnaDTO);
	}
	
	//----------------------admin--------------------------------------------------
	
	public List<ProductQnaDTO> getList_admin(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList_admin", pager);
	}
	
	public long getCount_admin(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount_admin", pager);
	}
	
	public ProductQnaOneDTO getOne_admin(ProductQnaOneDTO productQnaOneDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne_admin", productQnaOneDTO);
	}
}
