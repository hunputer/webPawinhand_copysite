package com.ph4.s1.board.shelter;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.board.file.ShelterFileDTO;
import com.ph4.s1.util.Pager;
import com.ph4.s1.voluntary.file.VoluntaryFileDTO;

@Controller
@RequestMapping("/shelter/**")
public class ShelterController {
	
	@Autowired
	private ShelterSevice shelterSevice;
	
	
	@GetMapping("shelterList")
	public ModelAndView getList(Pager pager, ShelterDTO shelterDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ShelterDTO> ar = shelterSevice.getList(pager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("shelter/shelterList");
		
		return mv;
	}
	
	
	//=======================================================================
	
	@GetMapping("shelterWrite")
	public ModelAndView setInsert(ShelterDTO shelterDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("shelter/shelterWrite");
		return mv;
	}
	
	
	@PostMapping("shelterWrite")
	public ModelAndView setInsert(ShelterDTO shelterDTO, MultipartFile [] files, HttpSession session, String period_1, String period_2) throws Exception{
		ModelAndView mv = new ModelAndView();
		shelterDTO.setPeriod_1(Date.valueOf(period_1));
		shelterDTO.setPeriod_2(Date.valueOf(period_2));
		
		int result = shelterSevice.setInsert(shelterDTO, files, session);
		String msg = "게시물 등록에 실패했습니다.";
		
		if(result>0) {
			msg = "게시물이 등록되었습니다.";
		}
		
		
		mv.addObject("msg", msg);
		mv.addObject("path", "./shelterList");
		mv.setViewName("common/result");
		
		return mv;
		
	}
	
	
	
	//=======================================================================
	
	@GetMapping("shelterSelect")
	public ModelAndView getOne(ShelterDTO shelterDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		shelterDTO = shelterSevice.getOne(shelterDTO);
		List<ShelterFileDTO> ar = shelterSevice.getFileOne(shelterDTO);
		
		if(shelterDTO != null) {
			mv.setViewName("shelter/shelterSelect");
			mv.addObject("dto", shelterDTO);
			mv.addObject("filelist", ar);
		}else {
			mv.setViewName("common/result");
			mv.addObject("msg", "데이터가 존재하지 않습니다.");
			mv.addObject("path", "./shelterList");
		}
		
		return mv;
	}
	
	
	@GetMapping("shelterMap")
	public ModelAndView kakaoMap(ShelterDTO shelterDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		shelterDTO = shelterSevice.getOne(shelterDTO);
		mv.addObject("dto", shelterDTO);
		mv.setViewName("shelter/shelterMap");
		return mv;
	}
	
	//=======================================================================
	
	@GetMapping("shelterDelete")
	public ModelAndView setDelete(ShelterDTO shelterDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = shelterSevice.setDelete(shelterDTO);
		String msg = "게시물 삭제에 실패했습니다.";
		
		if(result>0) {
			msg="게시물이 삭제되었습니다.";
		}
		
		mv.setViewName("common/result");
		mv.addObject("msg", msg);
		mv.addObject("path", "./shelterList");
		
		return mv;
	}
	
	//=======================================================================
	
	@GetMapping("shelterUpdate")
	public ModelAndView setUpdate(ShelterDTO shelterDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		shelterDTO = shelterSevice.getOne(shelterDTO);
		mv.addObject("updto",shelterDTO);
		mv.setViewName("shelter/shelterUpdate");
		return mv;
	}
	
	@PostMapping("shelterUpdate")
	public ModelAndView setUpdate(ShelterDTO shelterDTO, String msg) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = shelterSevice.setUpdate(shelterDTO);
		msg = "게시물 수정에 실패했습니다.";
		
		if(result>0) {
			msg="게시물이 수정되었습니다.";
		}
		
		mv.setViewName("common/result");
		mv.addObject("msg", msg);
		mv.addObject("path", "./shelterList");
		
		return mv;
	}
	
	
	
	


}
