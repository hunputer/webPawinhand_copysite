package com.ph4.s1.store.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.store.product.ProductDTO;

@Repository
public class StorePayDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ph4.s1.store.pay.StorePayDAO.";
	/*
	public List<CartDTO> getCartDetail(CartDTO cartDTO) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"getCartDetail", cartDTO);
	}
	
	public MemberDTO getMember(CartDTO cartDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getMember", cartDTO);
	}
	*/
	public int setOrderList(OrderListDTO orderListDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setOrderList", orderListDTO);
	}
	
	public int setPayInfo(PayInfoDTO payInfoDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setPayInfo", payInfoDTO);
	}
	
	public MemberDTO memberOne(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberOne", memberDTO);
				
	}
	
	public int setPoint(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setPoint", memberDTO);
	}
	
	public ProductDTO getOrderProduct(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderProduct", productDTO);
	}
	
	public int setProductStock(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setProductStock", productDTO);
	}
	
	public int setOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrderDetail", orderDetailDTO);
	}
	
	public OrderListDTO getOrderList(OrderListDTO orderListDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderList", orderListDTO);
	}
	public PayInfoDTO getPayInfo(OrderListDTO orderListDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPayInfo", orderListDTO);
	}
	
	public List<OrderDetailDTO> getOrderDetail(OrderListDTO orderListDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOrderDetail", orderListDTO);
	}
	
	public int setDepositInfo(DepositInfoDTO depositInfoDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setDepositInfo", depositInfoDTO);
	}
	
	public DepositInfoDTO getDepositInfo(OrderListDTO orderListDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDepositInfo", orderListDTO);
	} 
	
	public List<OrderDetailDTO> setMypage(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"setMyPage", id);
	}
}
