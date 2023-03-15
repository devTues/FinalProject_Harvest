package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.PaymentService;
import com.itwillbs.service.UserService;

@Controller
public class PayController {
	
	@Inject
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment/login", method = RequestMethod.GET)
	public String donationPage() { //임시 로그인화면!!!
		return "payment/login";
		
	}
	
	@RequestMapping(value="/payment/content", method = RequestMethod.POST)
	public String content(HttpSession session, UserDTO userDto, Model model, String id) { 
		 UserDTO dto = paymentService.getUser(id);
		 //세션값 생성
		 session.setAttribute("id", userDto.getId());
		 model.addAttribute("dto", dto);
		 return "payment/content";
	}
	
	@RequestMapping(value="/payment/payment", method = RequestMethod.POST)
	public String getUser(Model model, UserDTO userDto, String idx, HttpSession session, HttpServletRequest request) {
		int idx2 = Integer.parseInt(request.getParameter("idx"));
		int userDona = Integer.parseInt(request.getParameter("userDona"));
		ProjectDTO pdto = paymentService.getProject(idx);
		PaymentDTO paydto = new PaymentDTO();
		//세션값 가져오기
		String id = (String)session.getAttribute("id");
		UserDTO dto = paymentService.getUser(id);
		paydto.setUserDona(userDona);
		pdto.setIdx(idx2);
		model.addAttribute("pdto", pdto);
		model.addAttribute("paydto", paydto);
		model.addAttribute("dto", dto);
		return "payment/payment";
	}
	
	@RequestMapping(value="/payment/payment", method = RequestMethod.GET)
	public String getpayment(Model model, UserDTO userDto, String idx, HttpSession session, HttpServletRequest request) {
		int idx2 = Integer.parseInt(request.getParameter("idx"));
		int userDona = Integer.parseInt(request.getParameter("userDona"));
		System.out.println(userDona);
		ProjectDTO pdto = paymentService.getProject(idx);
		PaymentDTO paydto = new PaymentDTO();
		//세션값 가져오기
		String id = (String)session.getAttribute("id");
		UserDTO dto = paymentService.getUser(id);
		pdto.setIdx(idx2);
		paydto.setUserDona(userDona);
		model.addAttribute("pdto", pdto);
		model.addAttribute("paydto", paydto);
		model.addAttribute("dto", dto);
		return "payment/payment";
	}
	
	@RequestMapping(value="/payment/paySuccess", method = RequestMethod.GET)
	public String paySuccess(PaymentDTO paymentDto, ProjectDTO projectDto, Model model, String idx) {
		
		return "payment/paySuccess";
	}
}
