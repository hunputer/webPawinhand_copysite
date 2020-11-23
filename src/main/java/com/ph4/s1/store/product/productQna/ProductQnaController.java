package com.ph4.s1.store.product.productQna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.store.product.ProductService;
import com.ph4.s1.store.product.productQnaReply.ProductQnaReplyDTO;

@Controller
@RequestMapping(value = "/productQna/**")
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;
	
	@GetMapping("productQnaList")
	public ModelAndView getList(QnaPager qnaPager) {
		ModelAndView mv = new ModelAndView();
		List<ProductQnaDTO> ar = productQnaService.getList(qnaPager);
		mv.addObject("lists", ar);
		mv.addObject("pager", qnaPager);
		mv.setViewName("product/qna/qnaList");
		return mv;
	}
	
	@GetMapping("productQnaInsert")
	public ModelAndView setInsert(ProductQnaDTO productQnaDTO) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", productQnaDTO);
		mv.setViewName("product/qna/qnaInsert");
		return mv;
	}
	
	@PostMapping("productQnaInsert")
	public ModelAndView setInsert2(ProductQnaDTO productQnaDTO) {
		ModelAndView mv = new ModelAndView();
		int result = productQnaService.setInsert(productQnaDTO);
		String msg = "입력에 실패하였습니다.";
		if(result != 0) {
			msg = "입력에 성공하였습니다.";
		}
		mv.setViewName("product/qna/qnaInsertClose");
		mv.addObject("msg", msg);
		return mv;
	}
	
	@GetMapping("productQnaDelete")
	public ModelAndView setDelete(ProductQnaDTO productQnaDTO) {
		ModelAndView mv = new ModelAndView();
		int result = productQnaService.setDelete(productQnaDTO);
		long num = productQnaDTO.getProduct_num();
		mv.setViewName("redirect:../product/goodsSelect?product_num="+num);
		return mv;
	}
	
	@GetMapping("productQnaReplyInsert")
	public ModelAndView setReply(ProductQnaReplyDTO productQnaReplyDTO) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", productQnaReplyDTO);
		mv.setViewName("product/qna/qnaReplyInsert");
		return mv;
	}
	
	@PostMapping("productQnaReplyInsert")
	public ModelAndView setReply2(ProductQnaReplyDTO productQnaReplyDTO) {
		ModelAndView mv = new ModelAndView();
		int result = productQnaService.setReply(productQnaReplyDTO);
		String msg = "입력에 실패하였습니다.";
		if(result != 0) {
			msg = "입력에 성공하였습니다.";
		}
		mv.addObject("dto", productQnaReplyDTO);
		mv.setViewName("product/qna/qnaInsertClose");
		return mv;
	}
	
	@GetMapping("productQnaReplyDelete")
	public ModelAndView setReplyDelete(ProductQnaReplyDTO productQnaReplyDTO, long product_num) {
		ModelAndView mv = new ModelAndView();
		int result = productQnaService.setReplyDelete(productQnaReplyDTO);
		mv.setViewName("redirect:../product/goodsSelect?product_num="+product_num);
		return mv;
	}
	
}
