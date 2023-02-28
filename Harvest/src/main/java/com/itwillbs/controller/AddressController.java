package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.PaymentService;
import com.itwillbs.service.UserService;

@Controller
public class AddressController {
	
	@Inject
	private AddressService addressService;
	
	@Inject
	private PaymentService paymentService;
	

	@RequestMapping(value="/payment/address", method = RequestMethod.GET)
	public String address(UserDTO userDto, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		UserDTO dto = paymentService.getUser(id);
		model.addAttribute("dto", dto);
		return "payment/address";
		
	}
	
	@RequestMapping(value="/payment/addressPro", method = RequestMethod.GET)
	public String addressPro(AddressDTO addressDTO) { //주소 db 저장하는 메서드..
		 addressService.insertAddress(addressDTO);
		 System.out.println("들어갔니?");
		 
		 
		//payment에 값이 바로 뜨게..
		return "redirect:/payment/address";
		
	}
	
	
	
	
}



