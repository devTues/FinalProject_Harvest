package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.RegisterRequest;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserService;

@Controller
public class UserController {

	// 멤버변수
	@Inject
	private UserService userService;
	
//	[회원가입]
	@RequestMapping(value="/user/insert", method=RequestMethod.GET)
	public String insert() {
		
		return "user/insertForm";
	}
	
	@RequestMapping(value="/user/insertPro", method=RequestMethod.POST)
	public String insertPro(UserDTO userDto) {
		// 이벤트 수신 알람
		if (userDto.getEventAlr() == null) {
			userDto.setEventAlr("N");
		}
		
		userService.insertUser(userDto);
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "/user/loginPro", method = RequestMethod.POST)
	public String loginPro(UserDTO userDto, HttpSession session) {
		
		UserDTO userDTO2=userService.userCheck(userDto);
		String id = userDTO2.getId();
		String profile = userDTO2.getProfile();

		if(id == null) {
			return "user/msg";
		}
		
		if(id.equals("admin@harvest.com")) {
			return "redirect:/admin/userMain";
		}
		
		session.setAttribute("id", id);
		session.setAttribute("profile", profile);
		
		return "redirect:/projectList/main";
	}
	
	
//	[로그아웃]
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/projectList/main";
	}
	
	
//	[비밀번호 찾기 폼 보여주기]
	@RequestMapping(value = "/finding/findPass", method = RequestMethod.GET)
	public String findPass() {
		return "user/findPass";
	}
	
	
//	[이메일 입력하고 userCheck]
	@RequestMapping(value = "/finding/findpassPro", method = RequestMethod.POST)
	public String findpassPro(UserDTO userDto, HttpSession session) {
		UserDTO dto2 = userService.passCheck(userDto);
		if(dto2 != null) {
			session.setAttribute("id", dto2.getId());
			return "redirect:/finding/showPass";
		}else {
			return "user/mainPage";	
		}
	}
	
//	[비밀번호 보여주기]
	@RequestMapping(value = "/finding/showPass", method = RequestMethod.GET)
	public String showPass(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		UserDTO userDto = userService.getUser(id);
		
		model.addAttribute("userDto", userDto);
		System.out.println(userDto + " 되는거니?");
		
		return "user/showPass";
	}
	
	
}
