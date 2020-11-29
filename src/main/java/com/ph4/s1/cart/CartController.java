package com.ph4.s1.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.store.product.ProductDTO;
import com.ph4.s1.util.Pager;

@Controller
@RequestMapping(value = "/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("cartList")
	public ModelAndView getCartList(String id, HttpSession session) throws Exception {
		ModelAndView mv =  new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		id = memberDTO.getId();
		List<CartVO> ar = cartService.getCartList(id);
		mv.addObject("lists", ar);
		mv.setViewName("cart/cartList");
		return mv;
	}

	@PostMapping("cartInsert")
	public ModelAndView setCartInsert(CartVO cartDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		System.out.println(memberDTO);
		if(memberDTO == null) {
			mv.addObject("msg" , "로그인이 필요한 페이지 입니다");
			mv.addObject("path", "../member/memberLogin");
			mv.setViewName("common/result");
		}else {
			int count = cartService.getCartCount(cartDTO);
			if(count==0) {
				cartService.setCartInsert(cartDTO);
				mv.addObject("msg" , "장바구니에 상품이 담겼습니다");
				mv.addObject("path", "./cartList");
			}else {
				mv.addObject("msg" , "같은 상품이 장바구니에 있습니다.");
				cartService.setCartModify(cartDTO);
				mv.addObject("path", "./cartList");
			}
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("cartDelete")
	public ModelAndView setCartDelete(CartVO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("cartDelete");
		int result = cartService.setCartDelete(cartDTO);
		if(result>0) {
			mv.addObject("msg" , "해당 상품 장바구니 삭제 성공");
			
		}else {
			mv.addObject("msg" , "해당 상품 장바구니 삭제 실패");
		}
		mv.addObject("path", "./cartList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("cartUpdate")
	public ModelAndView setCartUpdate(CartVO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		cartDTO = cartService.getOne(cartDTO);
		mv.addObject("dto", cartDTO);
		mv.setViewName("/cart/cartUpdate");
		return mv;
	}
	
	@PostMapping("cartUpdate")
	public ModelAndView setCartUpdate(CartVO cartDTO, String msg) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = cartService.setCartUpdate(cartDTO);
		if(result>0) {
			msg = "장바구니 수량 수정 성공";
		}else {
			msg = "장바구니 수량 수정 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", "./cartList");
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("cartModify")
	public ModelAndView setCartModify(long num) throws Exception {
		ModelAndView mv = new ModelAndView();
		CartVO cartDTO = new CartVO();
		cartDTO.setCartNum(num);
		mv.addObject("dto", cartDTO);
		mv.setViewName("cart/cartModify");
		return mv;
	}
	
	@PostMapping("cartModify")
	public ModelAndView setCartModify(CartVO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = cartService.setCartModify(cartDTO);
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	

	

}
