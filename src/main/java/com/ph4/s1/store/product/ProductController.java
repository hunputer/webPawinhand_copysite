package com.ph4.s1.store.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.store.storeFile.StoreFileDTO;
import com.ph4.s1.store.storeFile.StoreFileService;

@Controller
@RequestMapping(value = "/product/**")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private StoreFileService storeFileService;
	
	@GetMapping("goodsSelect")
	public ModelAndView getGoodsSelect(ProductDTO productDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ProductDTO dto = productService.getOne(productDTO);
		List<StoreFileDTO> files = storeFileService.getFiles(productDTO);
		System.out.println(dto.getProduct_num());
		mv.addObject("member", memberDTO);
		mv.addObject("dto", dto);
		mv.addObject("files", files);
		mv.setViewName("product/goodsSelect");
		return mv;
	}
	
	@GetMapping("goodsList")
	public ModelAndView getGoodsList(ProductDTO productDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(productDTO.getCategory_num() == 0) {
			productDTO.setCategory_num(1);
		}
		List<ProductDTO> ar = productService.getList(productDTO);
		mv.addObject("lists", ar);
		mv.addObject("member", memberDTO);
		mv.setViewName("product/goodsList");
		return mv;
	}
	
	
	
//------------------------------------------------------------------------------------------------------
	
	


	@GetMapping("goodsWrite")
	public ModelAndView setInsert() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/goodsWrite");
		return mv;
	}
	
	@PostMapping("goodsWrite")
	public ModelAndView setInsert(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setInsert(productDTO, files, session);
		mv.setViewName("redirect:./goodsList");
		return mv;
	}
	
	@GetMapping("goodsDelete")
	public ModelAndView setDelete(ProductDTO productDTO) {
		ModelAndView mv = new ModelAndView();
		int result = productService.setDelete(productDTO);
		mv.setViewName("redirect:./goodsList");
		return mv;
	}
	
	@GetMapping("goodsUpdate")
	public ModelAndView setUpdate(ProductDTO productDTO) {
		ModelAndView mv = new ModelAndView();
		ProductDTO dto = productService.getOne(productDTO);
		mv.addObject("dto", dto);
		mv.setViewName("product/goodsUpdate");
		return mv;
	}
	
	@PostMapping("goodsUpdate")
	public ModelAndView setUpdate(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setUpdate(productDTO, files, session);
		long num = productDTO.getProduct_num();
		mv.setViewName("redirect:./goodsSelect?product_num=" + num);
		return mv;
	}
	
	@GetMapping("/review/myPageReview")
	public ModelAndView setmyPageReview() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("product/review/myPageReview");
		return mv;
	}
}