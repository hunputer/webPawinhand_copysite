package com.ph4.s1.store.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.ls.LSInput;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.store.product.ProductDTO;

@Service
public class StorePayService {
	
	@Autowired
	private StorePayDAO storePayDAO;
	@Autowired
	private StorePayService storePayService;
	
	/*
	public List<CartDTO> getCartDetail(CartDTO cartDTO) throws Exception{
		
		//상품별 포인트 계산 작업
		double points = 1;
		
		List<CartDTO> ar = storePayDAO.getCartDetail(cartDTO);
		
		//상품별 포인트 계산해서 넣기 
		for(int i=0; i<ar.size(); i++) {
			points = ar.get(i).getProductDTO().getPrice()*0.02;
			ar.get(i).setPoints(points);
		}
		
		return ar;
	}
	
	
	public MemberDTO getMember(CartDTO cartDTO) throws Exception{
		return storePayDAO.getMember(cartDTO);
	}
	*/
	public MemberDTO memberOne(MemberDTO memberDTO) throws Exception{
		return storePayDAO.memberOne(memberDTO);
	}
	
	//주문상품 리스트 불러오는거
	public ProductDTO getOrderProduct(ProductDTO productDTO) throws Exception{
		
		//상품별 포인트 계산 작업
		double points = 1;
				
		productDTO = storePayDAO.getOrderProduct(productDTO);
				
		//상품별 포인트 계산해서 넣기 
		points = productDTO.getPrice()*0.02;
		productDTO.setPoints(points);
			
		return productDTO;
	} 
	
	public long setOrderList(OrderListDTO orderListDTO, PayInfoDTO payInfoDTO, DepositInfoDTO depositInfoDTO,long [] detailNum, long [] detailAmount, long usePoint, long addPoint) throws Exception{
		
		String payMethod = payInfoDTO.getPayMethod().trim();
		String id =  orderListDTO.getOrderId();
		
		int result =  storePayDAO.setOrderList(orderListDTO);
		long num = orderListDTO.getOrder_num();
		
		payInfoDTO.setOrder_num(orderListDTO.getOrder_num());
		
		//무통장 입금시 디비 넣기
		if(depositInfoDTO.getDepositName()!= null) {
			depositInfoDTO.setOrder_num(orderListDTO.getOrder_num());
			int e = storePayService.setDepositInfo(depositInfoDTO);
			System.out.println(e);
		}
		
		//orderDetail에 넣는 작업
		for(int i=0; i<detailNum.length; i++) {
			ProductDTO dto = new ProductDTO();
			dto.setProduct_num(detailNum[i]);
			dto = storePayDAO.getOrderProduct(dto);
			
			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
			orderDetailDTO.setId(id);
			orderDetailDTO.setOrder_num(orderListDTO.getOrder_num());
			orderDetailDTO.setProduct_num(dto.getProduct_num());
			orderDetailDTO.setName(dto.getName());
			orderDetailDTO.setAmount(detailAmount[i]);
			orderDetailDTO.setPtotal(dto.getPrice()*detailAmount[i]);
			
			int r = storePayDAO.setOrderDetail(orderDetailDTO);
			System.out.println("오더 디테일 셋팅 결과:"+r);
		}
		
		System.out.println(payMethod);
		
		//payMethod가 신용카드로 잘 넘어온것은, 이미 결제가 완료되었다는 뜻임!!!
		//결제된애만 포인트, 재고 작업해주기
		if(payMethod.equals("신용카드/카카오페이/네이버페이")) {
			payInfoDTO.setIsPay(1);
			storePayService.setUsePoints(usePoint,id);
			storePayService.setAddPoints(addPoint, id);
			storePayService.setProductStock(detailNum, detailAmount);
			
		}
		
		int payInfoResult = storePayDAO.setPayInfo(payInfoDTO);
		
		System.out.println("결제정보 들어갔는지 : "+payInfoResult);
		
		//orderList의 order_num을 return 해줌!!!!
		return num;
	}
	
	//사용 포인트 빼기
	public void setUsePoints(long usePoint, String id) throws Exception{
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		
		memberDTO = storePayDAO.memberOne(memberDTO);
		
		//해당 멤버의 현재 포인트 받아와서 사용포인트 빼기
		long points =  memberDTO.getPoints();
		
		points = points - usePoint;
		
		memberDTO.setPoints(points);
		
		int result = storePayDAO.setPoint(memberDTO);
		System.out.println(" - 포인트 갱신결과 : "+result);
	}
	//적립포인트 더하기
	public void setAddPoints(long addPoint, String id) throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		
		memberDTO = storePayDAO.memberOne(memberDTO);
		
		//해당 멤버의 현재 포인트 받아와서 사용포인트 빼기
		long points =  memberDTO.getPoints();
		
		points = points + addPoint;
		
		memberDTO.setPoints(points);
		
		int result = storePayDAO.setPoint(memberDTO);
		System.out.println("add 포인트 갱신결과 : "+result);
	}
	
	//결제 완료되면 재고에서 빼기
	public void setProductStock(long [] detailNum, long [] detailAmount) throws Exception{
		
		for(int i =0; i<detailNum.length; i++) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProduct_num(detailNum[i]);
			productDTO = storePayDAO.getOrderProduct(productDTO);
			
			long amount = detailAmount[i];
			productDTO.setStock(productDTO.getStock() - amount);

			int result = storePayDAO.setProductStock(productDTO);
			System.out.println("재고수정 결과 : "+result);
		}
		
	}
	
	public OrderListDTO getOrderList(OrderListDTO orderListDTO) throws Exception{
		return storePayDAO.getOrderList(orderListDTO);
	}
	public PayInfoDTO getPayInfo(OrderListDTO orderListDTO) throws Exception{
		return storePayDAO.getPayInfo(orderListDTO);
	}
	
	public List<OrderDetailDTO> getOrderDetail(OrderListDTO orderListDTO) throws Exception{
		return storePayDAO.getOrderDetail(orderListDTO);
	}
	
	public int setDepositInfo(DepositInfoDTO depositInfoDTO) throws Exception{
		return storePayDAO.setDepositInfo(depositInfoDTO);
	}
	public DepositInfoDTO getDepositInfo(OrderListDTO orderListDTO) throws Exception{
		return storePayDAO.getDepositInfo(orderListDTO);
	}

}
