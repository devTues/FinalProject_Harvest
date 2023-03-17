package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.PaymentService;

@Controller
public class AddressController {
	
	@Inject
	private AddressService addressService;
	
	@Inject
	private PaymentService paymentService;
	
	// 지현
	@RequestMapping(value = "/myPage/myAddress", method = RequestMethod.GET)
	public String myAddressList(Model model, HttpSession session) {	// request대신 Model에 담음
		String id=(String)session.getAttribute("id");
		
		List<AddressDTO> addressList = addressService.getAddressList(id);
		model.addAttribute("addressList", addressList);
		
		return "myPage/myAddress";
	}
	
	@RequestMapping(value = "/myPage/insertAddressPro", method = RequestMethod.POST)
	   public String insertAddressPro(AddressDTO addressDto, HttpServletRequest request) {
	      String address = "";
	      
	      address += request.getParameter("address1");
	      address += request.getParameter("address2");
	      address += request.getParameter("address3");
	      
	      addressDto.setAddress(address);
	      addressService.insertAddress(addressDto);
	      
	      return "redirect:/myPage/myAddress";  
	   }

	
	@RequestMapping(value = "/myPage/deleteAddressPro", method = RequestMethod.POST)
	public String deleteAddressPro(AddressDTO addressDto) {
		addressService.deleteAddress(addressDto);
		
		return "redirect:/myPage/myAddress";
	}

	

	
	
	
	
}



