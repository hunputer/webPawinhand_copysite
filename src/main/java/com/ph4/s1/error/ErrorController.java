package com.ph4.s1.error;

import java.sql.SQLException;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ControllerAdvice
@RequestMapping("/error/**")
public class ErrorController {
	
	@GetMapping("error404")
	public ModelAndView error404() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error_front");
		
		return mv;
	}
	
	@GetMapping("error400")
	public ModelAndView error400() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error_front");
		
		return mv;
	}
	

	@ExceptionHandler(NullPointerException.class)
	public ModelAndView ex1() {
		ModelAndView mv = new ModelAndView();
		System.out.println("Null Pointer");
		mv.setViewName("error/error_back");
		return mv;
	}
	
	@ExceptionHandler(SQLException.class)
	public ModelAndView ex2() {
		ModelAndView mv = new ModelAndView();
		System.out.println("Sql Exception");
		mv.setViewName("error/error_back");
		return mv;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView ex3() {
		ModelAndView mv = new ModelAndView();
		System.out.println("Exception");
		mv.setViewName("error/error_back");
		return mv;
	}
	

}
