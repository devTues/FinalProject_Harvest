package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserService;

@Controller
public class UserController {
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)	
	public String insert() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "user/joinPage";
	}
	
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)	
	public String login() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "user/loginPage";
	}
	
	@RequestMapping(value = "/user/loginPro", method = RequestMethod.POST)
	public String loginPro(UserDTO userDto, HttpSession session) {
		UserDTO user = userService.userCheck(userDto);
		
		if(user != null) {
			// 아이디 비밀번호 일치 => memberDTO 주소 담아서 옴 => 세션값 생성, main 이동
			session.setAttribute("id", user.getId());
			
			// 이동방식 : 주소변경 하면서 이동
			// response.sendRedirect() 이동
			return "redirect:/mainpage/main";
		}else {
			// 아이디 비밀번호 틀림 => memberDTO null 넘어 옴 => "정보 틀림" 뒤로 이동
			// JavaScript를 바로 작성해도 되지만 jsp파일을 따로 만들어서 작성
			// member/msg.jsp 이동
			return "user/msg";
		}
		
	}
	
	@RequestMapping(value = "/mainpage/main", method = RequestMethod.GET)	
	public String main() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "mainpage/mainPage";
		
	}
}
