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
	
//	// 1. 생성자를 통해서 전달 (객체 생성한 것을 받아서 사용)
//	@Inject
//	private MemberController(MemberService memberService) {
//		this.memberService = memberService;
//	}
//	
//	// 2. set() 메서드 전달 (객체 생성한 것을 받아서 사용)
//	@Inject
//	public void setMemberService(MemberService memberService) {
//		this.memberService = memberService;
//	}
	
	// ==============================================================
	
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

//	============================================================================
    
    
//	[로그인]
//	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
//	public String login() {
//		
//		
//		// 기본 이동방식 : 주소변경 없이 이동
//		return "user/loginForm";
//	}
	
	@RequestMapping(value = "/user/loginPro", method = RequestMethod.POST)
	public String loginPro(UserDTO userDto, HttpSession session) {
		System.out.println(userDto.getId() + "설마설마");
		
		UserDTO userDTO2=userService.userCheck(userDto);
		String id = userDTO2.getId();
		

		if(id == null) {
			// 아이디 비밀번호 틀림 => userDTO null 넘어옴 => "정보틀림" 뒤로 이동 
			// member/msg.jsp 이동
			return "user/msg";
		}
		
		if(id.equals("admin@harvest.com")) {
			return "redirect:/admin/userMain";
		}
		
		// 아이디 비밀번호 일치 => userDTO 주소담아서 옴 => 세션값 생성, main 이동
		session.setAttribute("id", id);

		return "redirect:/projectList/main";
		
	}
	
	


	

// ==========================================================================
	
	
//	[로그아웃]
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 세션값 전체 삭제
		session.invalidate();
		
		// 기본 이동방식 : 주소변경 하면서 메인으로 이동(세션값 안보이니까!)
		return "redirect:/projectList/main";
	}
	
	
	
// ==========================================================================	
	
	
	
//	[비밀번호 찾기 폼 보여주기]
	@RequestMapping(value = "/finding/findPass", method = RequestMethod.GET)
	public String findPass() {
		
		// 기본 이동방식 : 주소변경 하면서 메인으로 이동
		return "user/findPass";
	}
	
	
//	[이메일 입력하고 userCheck]
	@RequestMapping(value = "/finding/findpassPro", method = RequestMethod.POST)
	public String findpassPro(UserDTO userDto, HttpSession session) {
		// DB에서 userCheck(userDTO)
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
