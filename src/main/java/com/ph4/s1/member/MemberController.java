package com.ph4.s1.member;

import java.lang.reflect.Member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.board.shelter.ShelterDTO;


@Controller
@RequestMapping(value = "/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("memberPage")
	public ModelAndView getmemberPage()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberPage");
		return mv;
	}
	
//----------------------------------------------------------------------------------------------------------	
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberLogin(memberDTO);
		
		if(memberDTO != null) {
			//index 페이지로 이동
			//redirect
			session.setAttribute("member", memberDTO);
			mv.setViewName("redirect:../");
			
		}else {
			//로그인 실패 메세지를 alert
			//로그인 입력 폼 으로 이동
			//foward
			mv.addObject("msg", "아이디와 비밀번호를 확인하세요.");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		
		return mv;
	}

//----------------------------------------------------------------------------------------------------------
	
	@GetMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberDTO = memberService.getMemberIdCheck(memberDTO);
		
		int result = 1; // 중복값
		
		if(memberDTO == null) {
			result = 0; 
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
			
		return mv;
	}
	
	

//----------------------------------------------------------------------------------------------------------	
	
	//getMemberLogout
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception{
		
		//웹브라우저 종료
		//일정시간 경과(로그인 후에 요청이 발생하면 시간이 연장)
		//MemberDTO를 NULL로 대체
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:../");
		return mv;
	}

//----------------------------------------------------------------------------------------------------------	
	
	//join
		@PostMapping("memberJoin")
		public ModelAndView setMemberJoin(MemberDTO memberDTO) throws Exception{
			ModelAndView mv = new ModelAndView();
			System.out.println(memberDTO.getMemberType());
			int result = memberService.setMemberJoin(memberDTO);
			if(result>0) {
				mv.addObject("msg" , "포인핸드에 오신걸 환영합니다!");
				mv.addObject("path", "../");
				mv.setViewName("common/result");
			}else {
				mv.addObject("msg" , "Join Fail");
				mv.addObject("path", "./memberJoin");
				mv.setViewName("common/result");
			}
			return mv;
		}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@GetMapping("memberJoinForm")
	public ModelAndView setMemberJoinForm(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberJoinForm");
		return mv;
	}
	
	
//----------------------------------------------------------------------------------------------------------
	
	@GetMapping("memberDeleteCheck")
		public ModelAndView setMemberDeleteCheck() throws Exception{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/memberDeleteCheck");
			return mv;
	}
	
	@GetMapping("memberDeleteInfo")
	public ModelAndView setMemberDeleteinfo(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getOne(memberDTO);
		mv.setViewName("member/memberDeleteInfo");
		return mv;
}
	
	
	@GetMapping("memberDelete")
	public ModelAndView setMemberDelete(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		int result = memberService.setMemberDelete(memberDTO);
		String msg="";
		
		if(result>0) {
			msg = "그동안 포인핸드를 이용해주셔서 감사합니다.";
			session.invalidate();
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "../");
		}else {
			msg = "회원 탈퇴에 실패했습니다.";
			mv.setViewName("common/result");			
			mv.addObject("msg", msg);
			mv.addObject("path", "../");
		}
		
		return mv;
	}
	
	
	
//----------------------------------------------------------------------------------------------------------
	
	@GetMapping("memberUpdateCheck")
	public ModelAndView setMemberUpdateCheck() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberUpdateCheck");
		return mv;
	}


	@GetMapping("memberUpdate")
	public ModelAndView setMemberUpdate(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
	
		memberDTO = memberService.getOne(memberDTO);
		mv.addObject("dto",memberDTO);
		mv.setViewName("member/memberUpdate");
		return mv;
	}


	@PostMapping("memberUpdate")
		public ModelAndView setMemberUpdate(MemberDTO memberDTO, String msg) throws Exception{
		ModelAndView mv = new ModelAndView();
	
		int result = memberService.setMemberUpdate(memberDTO);
	
		if(result>0) {
			msg = "회원 정보가 수정되었습니다.";
			mv.setViewName("common/result");
			mv.addObject("msg", msg);
			mv.addObject("path", "../");
		}else {
		
		}
		return mv;
	}
	
	@PostMapping("kakaoLogin")
		public ModelAndView kakaoLogin(MemberDTO memberDTO, HttpSession httpSession){
			ModelAndView mv = new ModelAndView();
			String id = "kakao_"+memberDTO.getId();
			memberDTO.setId(id);
			httpSession.setAttribute("member", memberDTO);
			return mv;
		}
	
	@GetMapping("naverLogin")
	public ModelAndView naverLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/memberLoginNaver");
		return mv;
	}
	
	@PostMapping("naverLogin")
	public ModelAndView naverLogin(HttpSession session, MemberDTO memberDTO) {
		ModelAndView mv = new ModelAndView();
		String id = "naver_"+memberDTO.getId();
		memberDTO.setId(id);
		session.setAttribute("member", memberDTO);
		return mv;
	}
	
}
