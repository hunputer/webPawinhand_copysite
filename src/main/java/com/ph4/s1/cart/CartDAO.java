package com.ph4.s1.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.util.Pager;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ph4.s1.cart.CartDAO.";
	
	public List<CartVO> getCartList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartList", id);
	}
	
	public int setCartInsert(CartVO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setCartInsert", cartDTO);
	}
	
	public int setCartDelete(CartVO cartDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setCartDelete", cartDTO);
	}
	
	public int setCartUpdate(CartVO cartDTO) throws Exception {
		 return sqlSession.update(NAMESPACE+"setCartUpdate", cartDTO);
	}
	
	public int getCartCount(CartVO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCartCount", cartDTO);
	}
	
	public int setCartModify(CartVO cartDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setCartModify", cartDTO);
	}
	
	public CartVO getOne(CartVO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getOne", cartDTO);
	}
}
