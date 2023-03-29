package com.itwillbs.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.UserService;
import com.itwillbs.utill.UploadFile;

@Controller
public class UserController {

	// 멤버변수
	@Inject
	private UserService userService;
	
	//xml 업로드 경로 (자원이름)=> 변수 저장
	@Resource(name = "uploadPath")
	private String uploadPath;
	
//	[회원가입]
	@RequestMapping(value="/user/insert", method=RequestMethod.GET)
	public String insert() {
		
		return "user/insertForm";
	}
	
	@RequestMapping(value="/user/insertPro", method=RequestMethod.POST)
	public String insertPro(HttpServletRequest request, UserDTO userDto, AddressDTO addressDto, MultipartFile file) throws Exception{
		// 이벤트 수신 알람
		if (userDto.getEventAlr() == null) {
			userDto.setEventAlr("N");
		}
		// 우편번호 + 배송지
//		String address = addressDto.getAddress();
		
		// 절대경로
		String Path = request.getRealPath("resources/upload");
				
		String filename = UploadFile.fileUpload(file, uploadPath, Path);
		
		userDto.setId(request.getParameter("id"));
		userDto.setPass(request.getParameter("pass"));
		userDto.setName(request.getParameter("name"));
		userDto.setPhone(request.getParameter("phone"));
		userDto.setProfile(filename);
		
		userService.insertUser(userDto);
		userService.insertAddress(addressDto);  // 우편번호 + 주소
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value = "/user/loginPro", method = RequestMethod.POST)
	public String loginPro(UserDTO userDto, HttpSession session) {
		UserDTO userDTO2=userService.userCheck(userDto);
		String id = userDTO2.getId();
		
		if(id == null) {
			return "user/msg";
		}
		
		if(id.equals("admin@harvest.com")) {
			return "redirect:/admin/userList";
		}
		
		// 아이디 비밀번호 일치 => userDTO 주소담아서 옴 => 세션값 생성, main 이동
		session.setAttribute("id", id);
		session.setAttribute("profile", userDTO2.getProfile());
		
		return "redirect:/projectList/main";
	}
	
	
	
//	[로그아웃]
	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 세션값 전체 삭제
		session.invalidate();
		

		return "redirect:/projectList/main";
	}
	
	
//	[비밀번호 찾기 폼 보여주기]
	@RequestMapping(value = "/finding/findPass", method = RequestMethod.GET)
	public String findPass() {
		
		return "user/finding/findPass";
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
		
		return "user/finding/showPass";
	}
	
	
}
