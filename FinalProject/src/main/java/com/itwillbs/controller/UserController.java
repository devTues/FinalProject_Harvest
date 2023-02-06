package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)	
	public String insert() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "member/join";
	}
}
