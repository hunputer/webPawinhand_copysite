package com.ph4.s1.store.product.productDetail;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/productDetail/**")
public class ProductDetailController {
	
	@Autowired
	public ProductDetailService productDetailService;
	
	@GetMapping("productDetailList")
	public ModelAndView getList(ProductDetailDTO productDetailDTO) {
		ModelAndView mv = new ModelAndView();
		List<ProductDetailDTO> ar = productDetailService.getList(productDetailDTO);
		mv.addObject("lists", ar);
		mv.setViewName("product/detail/detailList");
		return mv;
	}
	
	@GetMapping("productDetailInsert")
	public ModelAndView setInsert(ProductDetailDTO productDetailDTO) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", productDetailDTO);
		mv.setViewName("product/detail/detailInsert");
		return mv;
	}
	
	@PostMapping("productDetailInsert")
	public ModelAndView setInsert2(ProductDetailDTO productDetailDTO, MultipartFile[] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productDetailService.setInsert(productDetailDTO, files, session);
		String msg="입력에 실패하였습니다.";
		if(result > 0) {
			msg = "입력에 성공하였습니다.";
		}
		mv.addObject("msg",msg);
		mv.setViewName("product/detail/detailInsertClose");
		return mv;
	}
	
	@GetMapping("productDetailDelete")
	public ModelAndView setDelete(ProductDetailDTO productDetailDTO) {
		ModelAndView mv = new ModelAndView();
		int result = productDetailService.setDelete(productDetailDTO);
		long num = productDetailDTO.getProduct_num();
		mv.setViewName("redirect:../product/goodsSelect?product_num="+num);
		return mv;
	}
}
