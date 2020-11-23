package com.ph4.s1.store.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping(value = "/review/**")
public class ProductReviewController {
	
	@Autowired
	private ProductReviewService productReviewService;
	
	@GetMapping("reviewList")
	public ModelAndView getList(ReviewPager reviewPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductReviewDTO> ar = productReviewService.getList(reviewPager);
		mv.addObject("num", reviewPager.getProduct_num());
		mv.addObject("lists", ar);
		mv.addObject("pager", reviewPager);
		mv.setViewName("product/review/reviewList");
		return mv;
	}
	
	@PostMapping("reviewInsert")
	public ModelAndView setInsert(ProductReviewDTO productReviewDTO,MultipartFile file, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		productReviewDTO.setStarCount(3);
		int result = productReviewService.setInsert(productReviewDTO, file, session);
		long product_num = productReviewDTO.getProduct_num();
		mv.setViewName("redirect:../product/goodsSelect?product_num="+ product_num);
		return mv;
	}
	
	@GetMapping("reviewDelete")
	public ModelAndView setDelete(ProductReviewDTO productReviewDTO) {
		ModelAndView mv = new ModelAndView();
		int result = productReviewService.setDelete(productReviewDTO);
		long product_num = productReviewDTO.getProduct_num();
		mv.setViewName("redirect:../product/goodsSelect?product_num="+ product_num);
		return mv;
	}
}
