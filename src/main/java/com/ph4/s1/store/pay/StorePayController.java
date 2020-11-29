package com.ph4.s1.store.pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.store.product.ProductDTO;

@Controller
@RequestMapping("/storePay/**")
public class StorePayController {

	@Autowired
	private StorePayService storePayService;
	
	
	@PostMapping("storePayment")
	public ModelAndView getStorePayment(OrderListDTO orderListDTO,long [] detailNum, long [] detailAmount,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("스토어페이먼트들어옴");
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		
		long result =  storePayService.setOrderList_card(orderListDTO,detailNum,detailAmount,member.getId());
		OrderListDTO orderListDTO2 = storePayService.getOrderList(orderListDTO);
		
		mv.addObject("dto", orderListDTO2);
		mv.addObject("num", result);
		mv.setViewName("storePay/storePayment");
		return mv;
		
	}
	
	@GetMapping("setCardPay")
	public ModelAndView setCardPay(long num, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		PayInfoDTO payInfoDTO = new PayInfoDTO();
		
		payInfoDTO.setOrder_num(num);
		payInfoDTO.setIsPay(1);
		payInfoDTO.setId(member.getId());
		payInfoDTO.setPayMethod("신용카드/카카오페이/네이버페이");
			
		//포인트, 재고 셋팅
		//오더리스트 가져옴
		OrderListDTO orderListDTO = new OrderListDTO();
		orderListDTO.setOrder_num(num);
		orderListDTO = storePayService.getOrderList(orderListDTO);
		//오더디테일 가져오기 - 포인트 작업 위해서 -addPoint
		List<OrderDetailDTO> ar = storePayService.getOrderDetail(orderListDTO);
		long[] ptotal = new long[ar.size()];
		long[] detailNum = new long[ar.size()];
		long[] detailAmount = new long[ar.size()];
		long realP = 0;
		long addPoint =0;
		for(int i=0; i<ar.size(); i++) {
			ptotal[i] = ar.get(i).getPtotal();
			detailNum[i]=ar.get(i).getProduct_num();
			detailAmount[i]=ar.get(i).getAmount();
			
			realP += ptotal[i];
			addPoint += realP*0.02;

		}
		System.out.println("realP"+realP);
		long usePoint=0;
		if(realP > 50000){
			usePoint = realP - orderListDTO.getTotal();
		}else {
			usePoint = (realP+3000) - orderListDTO.getTotal();
		}
	
		System.out.println("addpoint : "+addPoint);
		System.out.println("usePoint : "+usePoint);
		//point 작업
		storePayService.setUsePoints(usePoint, member.getId());
		storePayService.setAddPoints(addPoint, member.getId());
		
		//재고작업
		storePayService.setProductStock(detailNum, detailAmount);
		
		payInfoDTO.setTotalPrice(orderListDTO.getTotal());
		int payInfoResult = storePayService.setPayInfo(payInfoDTO);	
		System.out.println("결제정보 들어갔는지 : "+payInfoResult);
		
		mv.addObject("msg", "주문이 정상적으로 완료되었습니다.");
		mv.addObject("path", "./storePayInfo?order_num="+num);
			
		mv.setViewName("common/result");
		
		return mv;
		
	}
	
	@GetMapping("setOrderList_card")
	public ModelAndView setOrderList_card(OrderListDTO orderListDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getId();
		orderListDTO = storePayService.getOrderList(orderListDTO);
		
		PayInfoDTO payInfoDTO = new PayInfoDTO();
		long num = orderListDTO.getOrder_num();
		
		payInfoDTO.setOrder_num(num);
		payInfoDTO.setIsPay(0);
		payInfoDTO.setId(member.getId());
		payInfoDTO.setPayMethod("신용카드/카카오페이/네이버페이");
		payInfoDTO.setTotalPrice(orderListDTO.getTotal());
		
		int result = storePayService.setPayInfo(payInfoDTO);
		
		
		if(result > 0) {
			mv.addObject("msg", "주문이 정상적으로 완료되었습니다.");
			mv.addObject("path", "./storePayInfo?order_num="+num);
			
		}else {
			mv.addObject("msg", "다시 시도해주세요.");
			mv.addObject("path", "../product/goodList");
		}
			
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("test")
	public ModelAndView viewTest() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("storePay/test");
		return mv;
	}
	
	@PostMapping("storePayMain")
	public ModelAndView getStoreMainPay(MemberDTO memberDTO, long [] product_num, long [] amount) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("1번수량 : "+amount[0]);
		memberDTO = storePayService.memberOne(memberDTO);
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		
		for(int i =0; i<product_num.length; i++) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProduct_num(product_num[i]);	
			productDTO = storePayService.getOrderProduct(productDTO);
			productDTO.setAmount(amount[i]);
			ar.add(productDTO);		
		}
		
		mv.addObject("list", ar);
		mv.addObject("member", memberDTO);
		mv.setViewName("storePay/storePayMain");
		
		return mv;
		
	}
	
	
	@GetMapping("storePayInfo")
	public ModelAndView getPayInfo(OrderListDTO orderListDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		orderListDTO = storePayService.getOrderList(orderListDTO);
		PayInfoDTO payInfoDTO = storePayService.getPayInfo(orderListDTO);
		List<OrderDetailDTO> ar = storePayService.getOrderDetail(orderListDTO);
		
		String method= payInfoDTO.getPayMethod().trim();
		if(method.equals("무통장 입금")) {
			DepositInfoDTO depositInfoDTO2 = storePayService.getDepositInfo(orderListDTO);
			mv.addObject("deposit", depositInfoDTO2);
		}
		
		
		mv.addObject("ar", ar);
		mv.addObject("pay", payInfoDTO);
		mv.addObject("list", orderListDTO);
		mv.setViewName("storePay/storePayInfo");
		return mv;
	}
	
	@PostMapping("setOrderList")
	public ModelAndView setOrderList(OrderListDTO orderListDTO, PayInfoDTO payInfoDTO, DepositInfoDTO depositInfoDTO,long [] detailNum, long [] detailAmount ,long usePoint, long addPoint) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("사용포인트:"+usePoint);
		System.out.println("입금자명:"+depositInfoDTO.getDepositName());
		
		//return 값은 order_num 임
		long result = storePayService.setOrderList(orderListDTO,payInfoDTO, depositInfoDTO,detailNum, detailAmount,usePoint, addPoint);
		
		System.out.println("order_num="+result);
		
		if(result > 0) {
			mv.addObject("msg", "주문이 정상적으로 완료되었습니다.");
			mv.addObject("path", "./storePayInfo?order_num="+result);
			
		}else {
			mv.addObject("msg", "다시 시도해주세요.");
			mv.addObject("path", "../product/goodList");
		}
			
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	@PostMapping("setOrderListCard")
	public ModelAndView setOrderListCard() throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("카드메소드 들어옴");
		mv.setViewName("storePay/storePayment");
		
		return mv;
	}
}
