package com.ph4.s1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ph4.s1.util.Pager;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;

	public List<CartVO> getCartList(String id) throws Exception {
		return cartDAO.getCartList(id);
	}
	
	public int setCartInsert(CartVO cartDTO) throws Exception {
		return cartDAO.setCartInsert(cartDTO);
	}
	
	public int setCartDelete(CartVO cartDTO) throws Exception {
		return cartDAO.setCartDelete(cartDTO);
	}
	
	public int setCartUpdate(CartVO cartDTO) throws Exception {
		return cartDAO.setCartUpdate(cartDTO);
	}
	
	public int getCartCount(CartVO cartDTO) throws Exception {
		return cartDAO.getCartCount(cartDTO);
	}
}
