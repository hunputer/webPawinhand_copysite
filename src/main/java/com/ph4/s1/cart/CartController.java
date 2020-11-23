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
		int result = cartService.setCartInsert(cartDTO);
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	
	@GetMapping("cartDelete")
	public ModelAndView setCartDelete(CartVO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("cartDelete");
		int result = cartService.setCartDelete(cartDTO);
		mv.setViewName("redirect:./cartList");
		return mv;
	}
	
	@GetMapping("cartUpdate")
	public ModelAndView setCartUpdate(long num) throws Exception {
		ModelAndView mv = new ModelAndView();
		CartVO cartDTO = new CartVO();
		cartDTO.setCartNum(num);
		mv.addObject("dto", cartDTO);
		mv.setViewName("cart/cartUpdate");
		return mv;
	}
	
	@PostMapping("cartUpdate")
	public ModelAndView setCartUpdate(CartVO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = cartService.setCartUpdate(cartDTO);
		mv.setViewName("redirect:./cartList");
		return mv;
	}
}
