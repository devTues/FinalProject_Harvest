package com.itwillbs.controller;


import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.openbank.domain.RequestTokenDTO;
import com.itwillbs.openbank.domain.ResponseTokenDTO;
import com.itwillbs.openbank.domain.UserInfoRequestDTO;
import com.itwillbs.openbank.domain.UserInfoResponseDTO;
import com.itwillbs.openbank.service.OpenBankingService;


@Controller
public class OpenBankingController {
	
	// 객체생성
	@Inject
	private OpenBankingService openBankingService;
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String getToken(RequestTokenDTO requestTokenDTO, Model model) throws Exception {
		// 인증
		// 결과
		// 응답 메세지 HTTP URL <callback_uri> [Callback URL 로 redirect]
		// HTTP Method GET -->
		// 요청 메시지 명세	// code        <authorization_code>
						// scope 	   [login|inquiry|transfer|cardinfo|fintechinfo]
						// client_info <client_info> 
						// state       <state>
		// 인증 후 결과값 받아서 출력
		
		// 토큰 발급 => code, client_id, client_secret, redirect_uri,  grant_type
		// 토큰 발급 처리
		ResponseTokenDTO responseTokenDTO = openBankingService.requestToken(requestTokenDTO);
		
		UserInfoRequestDTO userInfoRequestDTO = new UserInfoRequestDTO();
		userInfoRequestDTO.setAccess_token(responseTokenDTO.getAccess_token());
		userInfoRequestDTO.setUser_seq_no(responseTokenDTO.getUser_seq_no());
		
		UserInfoResponseDTO userInfoResponseDTO = openBankingService.findUser(userInfoRequestDTO);
		// 리턴 정보를 저장
		model.addAttribute("userInfoResponseDTO", userInfoResponseDTO);
		
		return "accountList";
	}
	

}
