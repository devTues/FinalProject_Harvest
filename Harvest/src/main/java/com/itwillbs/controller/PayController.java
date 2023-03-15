package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import com.itwillbs.service.PaymentService;
import com.itwillbs.service.UserService;

@Controller
public class PayController {
	
	@Inject
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment/content", method = RequestMethod.POST)
	public String content(HttpSession session, UserDTO userDto, Model model, String id) { 
		 UserDTO dto = paymentService.getUser(id);
		 //세션값 생성
		 session.setAttribute("id", userDto.getId());
		 model.addAttribute("dto", dto);
		 return "payment/content";
	}
	
	@RequestMapping(value="/payment/payment", method = RequestMethod.POST)
	public String getUser(Model model
			, @RequestParam("idx") String idx
			, @RequestParam("userDona") int userDona, HttpSession session ) {
//		int userDona = Integer.parseInt(request.getParameter("userDona"));
		ProjectDTO pdto = paymentService.getProject(idx);
//		PaymentDTO paydto = new PaymentDTO();
		//세션값 가져오기
		String id = (String)session.getAttribute("id");
		UserDTO dto = paymentService.getUser(id);
		
		// 결제일 계산
		Date date = pdto.getEnd();
		SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		cal.add(Calendar.DATE, 1);
		String payDate = sdfYMD.format(cal.getTime());
//		paydto.setUserDona(userDona);
//		pdto.setIdx(idx2);
		model.addAttribute("pdto", pdto);
		model.addAttribute("userDona", userDona);
		model.addAttribute("payDate", payDate);
		model.addAttribute("dto", dto);
		return "payment/payment";
	}
		
	@RequestMapping(value="/payment/paySuccess", method = RequestMethod.GET)
	public String paySuccess(PaymentDTO paymentDto, ProjectDTO projectDto, Model model, String idx) {
		
		return "payment/paySuccess";
	}
}
