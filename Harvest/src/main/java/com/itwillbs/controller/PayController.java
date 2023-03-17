package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.ProjectInfoService;
import com.itwillbs.service.UserService;

@Controller
public class PayController {
	
	@Inject
	private ProjectInfoService ProjectInfoService;
	@Inject
	private UserService userService;
	@Inject
	private AddressService addressService;
	
	@RequestMapping(value="/payment/payment", method = RequestMethod.POST)
	public String getUser(Model model
			, @RequestParam("idx") String idx
			, @RequestParam("userDona") int userDona, HttpSession session ) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("IDX", idx + "");
		param = ProjectInfoService.getProjectInfo(param);
		//세션값 가져오기
		String id = (String)session.getAttribute("id");
		UserDTO UserDto = userService.getUser(id);
		AddressDTO AddDto = addressService.getAddress(id).get(0);
		
		model.addAttribute("projectParam", param);
		model.addAttribute("userDona", userDona);
		model.addAttribute("AddDto",AddDto);
		model.addAttribute("UserDto", UserDto);
		return "payment/payment";
	}
		
	@RequestMapping(value="/payment/paySuccess", method = RequestMethod.GET)
	public String paySuccess(PaymentDTO paymentDto, ProjectDTO projectDto, Model model, String idx) {
		
		return "payment/paySuccess";
	}
}
