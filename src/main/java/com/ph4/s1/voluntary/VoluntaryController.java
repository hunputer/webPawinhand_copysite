package com.ph4.s1.voluntary;

import java.sql.Date;
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
import com.ph4.s1.util.Pager;
import com.ph4.s1.voluntary.file.VoluntaryFileDTO;
import com.ph4.s1.voluntary.reserve.VoluntaryReserveDTO;

@Controller
@RequestMapping("voluntary/**")
public class VoluntaryController {
	
	@Autowired
	private VoluntaryService voluntaryService;
	
	@GetMapping("voluntaryList")
	public ModelAndView getVoluntaryList(Pager pager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<VoluntaryDTO> ar = voluntaryService.getVoluntaryList(pager);
		mv.addObject("dto", ar);
		mv.addObject("pager", pager);
		
		mv.setViewName("voluntary/voluntaryList");
		
		return mv;
	}
	
	@GetMapping("voluntarySelect")
	public ModelAndView getVoluntaryOne(VoluntaryDTO voluntaryDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		voluntaryDTO = voluntaryService.getVoluntaryOne(voluntaryDTO);
		List<VoluntaryFileDTO> files = voluntaryService.getOne(voluntaryDTO);//해당 사람이 등록한 파일  이름 리스트 가져오기
		
		mv.addObject("files", files);//파일이름 리스트로 jsp에 뿌리기
		mv.addObject("dto", voluntaryDTO);
		mv.setViewName("voluntary/voluntarySelect");
		
		return mv;
	}
	
	@GetMapping("voluntaryUpdate")
	public ModelAndView setVoluntaryUpdate(VoluntaryDTO voluntaryDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		voluntaryDTO = voluntaryService.getVoluntaryOne(voluntaryDTO);
		List<VoluntaryFileDTO> files = voluntaryService.getOne(voluntaryDTO);//해당 사람이 등록한 파일  이름 리스트 가져오기
		mv.addObject("files", files);//파일이름 리스트로 jsp에 뿌리기
		
		mv.addObject("dto", voluntaryDTO);
		mv.setViewName("voluntary/voluntaryUpdate");
		
		return mv;
	}
	
	@PostMapping("voluntaryUpdate")
	public ModelAndView setVoluntaryUpdate2(VoluntaryDTO voluntaryDTO, MultipartFile [] files2, HttpSession session) throws Exception{
		
		//파일 controller까지 오는지 확인
		for(int i=0;i<files2.length;i++) {
			System.out.println(files2[i].getOriginalFilename());
		}
		
		ModelAndView mv = new ModelAndView();
		int result = voluntaryService.setVoluntaryUpdate(voluntaryDTO, files2, session);
		
		if(result > 0) {
			mv.addObject("msg", "수정이 완료되었습니다.");
			mv.addObject("path", "./voluntarySelect?num="+voluntaryDTO.getNum());
		}else {
			mv.addObject("msg", "다시 입력해주세요.");
		}
		
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("voluntaryDelete")
	public ModelAndView setVoluntaryDelete(VoluntaryDTO voluntaryDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = voluntaryService.setVoluntaryDelete(voluntaryDTO);
		
		if(result > 0) {
			mv.addObject("msg", "삭제가 완료되었습니다.");
			mv.addObject("path", "./voluntaryList");
		}else {
			mv.addObject("msg", "다시시도해주세요.");
		}
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("voluntaryWrite")
	public ModelAndView setVoluntaryInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("voluntary/voluntaryWrite");
		return mv;
	}
	
	@PostMapping("voluntaryWrite")
	public ModelAndView setVoluntaryInsert(VoluntaryDTO voluntaryDTO, MultipartFile [] files, HttpSession session) throws Exception{
		
		//파일 controller까지 오는지 확인
		for(int i=0;i<files.length;i++) {
			System.out.println(files[i].getOriginalFilename());
		}
		
		ModelAndView mv = new ModelAndView();
		int result = voluntaryService.setVoluntaryInsert(voluntaryDTO, files, session);
		
		
		if(result > 0) {
			mv.addObject("msg", "등록이 완료되었습니다.");
			mv.addObject("path", "./voluntaryList");
		}else {
			mv.addObject("msg", "다시시도해주세요.");
		}
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("/calendar/reserveCalendar")
	public ModelAndView getCalendar(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("캘린더 들어옴");
		
		List<VoluntaryReserveDTO> ar = voluntaryService.getResList(voluntaryReserveDTO);
		//System.out.println(ar.get(index));
		mv.addObject("list", ar);
		mv.addObject("dto", voluntaryReserveDTO);
		mv.setViewName("voluntary/calendar/reserveCalendar");
		
		return mv;
	}
	
	
	@GetMapping("/calendar/reserveVoluntary")
	public ModelAndView setReserve(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println("봉사예약 들어옴"+voluntaryReserveDTO.getNum());
		System.out.println(voluntaryReserveDTO.getResDate());
		mv.addObject("dto", voluntaryReserveDTO);
		mv.setViewName("voluntary/calendar/reserveVoluntary");
		
		return mv;
	}
	
	@PostMapping("/calendar/reserveVoluntary")
	public ModelAndView setResInsert(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("봉사 신청들어옴");
		int result = voluntaryService.setResInsert(voluntaryReserveDTO);
		
		if(result > 0) {
			mv.addObject("msg", "봉사신청이 완료되었습니다.");
			
		}else {
			mv.addObject("msg", "다시시도해주세요.");
		}
		System.out.println("넘 : "+voluntaryReserveDTO.getNum());
		mv.addObject("path", "./reserveCalendar?num="+voluntaryReserveDTO.getNum());
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("/calendar/reserveInfo")
	public ModelAndView reserveInfo(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("info 들어옴");
		
		voluntaryReserveDTO = voluntaryService.getResOne(voluntaryReserveDTO);
		mv.addObject("dto", voluntaryReserveDTO);
		
		mv.setViewName("voluntary/calendar/reserveInfo");
		
		return mv;
	} 
	
	@GetMapping("/calendar/reserveDelete")
	public ModelAndView volResDel(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		long num = voluntaryReserveDTO.getNum();
		System.out.println(num);
		System.out.println(voluntaryReserveDTO.getId());
		
		int result = voluntaryService.setResDel(voluntaryReserveDTO);
		 
		 if(result > 0) {
				mv.addObject("msg", "봉사신청이 취소되었습니다.");
				
			}else {
				mv.addObject("msg", "다시시도해주세요.");
			}
			
		 mv.addObject("path", "./reserveCalendar?num="+num);
			mv.setViewName("common/result");
			
		 
		return mv;
	} 
	
	@GetMapping("volUpdateFileDel")
	public ModelAndView setFileDel(VoluntaryFileDTO voluntaryFileDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = voluntaryService.setFileDel(voluntaryFileDTO, session);
		
		if(result > 0) {
			mv.addObject("msg", "삭제되었습니다.");
			
		}else {
			mv.addObject("msg", "다시시도해주세요.");
		}
		
		mv.setViewName("voluntary/voluntaryAjax");
		
		return mv;
	}
	
	
}
