package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.PaymentService;

@Controller
public class AddressController {
	
//	@Inject
//	private AddressService addressService;
	
	@Inject
	private PaymentService paymentService;


	@RequestMapping(value="/payment/address", method = RequestMethod.POST)
	public String address(UserDTO userDto, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		UserDTO dto = paymentService.getUser(id);
		model.addAttribute("dto", dto);
		return "payment/address";
	}
	
	
	
	
	
}



