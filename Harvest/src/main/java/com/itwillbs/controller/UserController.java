package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserService;


@Controller
public class UserController {
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)	
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value = "/user/joinPro", method = RequestMethod.POST)
	public String joinPro(UserDTO userDTO) {
		userService.insertUser(userDTO);
		return "redirect:/User/login";
	}
	
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)	
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "/user/loginPro", method = RequestMethod.POST)
	public String loginPro(UserDTO userDTO, HttpSession session) {
		UserDTO userDTO2=userService.userCheck(userDTO);
		if(userDTO2!=null) {
			session.setAttribute("id", userDTO2.getId());
			return "redirect:/projectList/main";
		} else {
			return"user/msg";
		}
	}
	
	@RequestMapping(value = "/user/rePass", method = RequestMethod.GET)	
	public String rePass() {
		return "user/rePass";
	}
	
	
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/projectList/main";
	} 
	
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		String id=(String)session.getAttribute("id");
		UserDTO userDTO=userService.getUser(id);
		model.addAttribute("UserDTO", userDTO);
		return "/user/update"; 
	}
	
	@RequestMapping(value = "/user/updatePro", method = RequestMethod.POST)
	public String updatePro(UserDTO userDTO) {
		UserDTO userDTO2=userService.userCheck(userDTO);
		if(userDTO2!=null) {
			userService.updateUser(userDTO);
			return "redirect:/projectList/main";
		} else {
			return "user/msg";
		}
			
	}
	
}
