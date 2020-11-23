package com.ph4.s1.board.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.board.BoardDTO;
import com.ph4.s1.util.Pager;

@Controller
@RequestMapping(value = "/community/**")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	

	@GetMapping("communityDelete")
	public ModelAndView setDelete(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Community Delete");
		int result = communityService.setDelete(boardDTO);
		
		if(result!=0) {
			mv.setViewName("common/result");
			mv.addObject("msg", "Delete Success");
			mv.addObject("path","./communityList");
		}else {
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	

	@GetMapping("communitySelect")
	public ModelAndView getOne(BoardDTO boardDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = communityService.getOne(boardDTO);
		if(boardDTO != null) {
			mv.setViewName("board/boardSelect");
			mv.addObject("dto", boardDTO);
			mv.addObject("board", "community");
		}else {
			mv.setViewName("common/result");
			mv.addObject("msg", "No Data");
			mv.addObject("path", "./communityList");
		}
		
		return mv;
				
	}
	
	
	@GetMapping("communityUpdate")
	public ModelAndView setUpdate(long num)throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setNum(num);
		CommunityDTO communityDTO = communityService.getOne(boardDTO);
		mv.addObject("dto", communityDTO);
		mv.setViewName("board/boardUpdate");
		mv.addObject("board", "community");
		
		return mv;
	}
	
	@PostMapping("communityUpdate")
	public ModelAndView setUpdate(CommunityDTO communityDTO, MultipartFile[] files, HttpSession httpSession) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = communityService.setUpdate(communityDTO, files, httpSession);
		
		if(result!=0) {
			
			mv.addObject("msg", "Update Success");
		}
		
		mv.addObject("path","./communityList");
		mv.setViewName("common/result");
		return mv;
		
		
	}
	
	
	@PostMapping("communityWrite")
	public ModelAndView setInsert(CommunityDTO communityDTO)throws Exception{

		ModelAndView mv = new ModelAndView();
		int result = communityService.setInsert(communityDTO);
		String message="Write Fail";
		if(result>0) {
			message ="Write Success";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", "./communityList");
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("communityWrite")
	public ModelAndView setInsert()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", "community");
		mv.setViewName("board/boardWrite");
		return mv;
	}
	
	
	@GetMapping("communityList")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO>  ar = communityService.getList(pager);
		mv.addObject("board", "community");
		mv.addObject("lists", ar);
		mv.addObject("pager", pager);
		mv.addObject("name", "커뮤니티");
		System.out.println("Community List");
		mv.setViewName("board/boardList"); 
		return mv;
	}
}
