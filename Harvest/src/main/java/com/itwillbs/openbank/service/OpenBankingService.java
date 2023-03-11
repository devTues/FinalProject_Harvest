package com.itwillbs.openbank.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.openbank.domain.RequestTokenDTO;
import com.itwillbs.openbank.domain.ResponseTokenDTO;
import com.itwillbs.openbank.domain.UserInfoRequestDTO;
import com.itwillbs.openbank.domain.UserInfoResponseDTO;

@Service
public class OpenBankingService {
	// 객체생성
	@Inject
	private OpenBankingApiClient openBankingApiClient;
	
	// 토큰 발급 요청
	public ResponseTokenDTO requestToken(RequestTokenDTO requestTokenDTO) {
		System.out.println("토큰 service");
		return openBankingApiClient.requestToken(requestTokenDTO);
	}
	
	// 사용자 정보 조회
	public UserInfoResponseDTO findUser(UserInfoRequestDTO userInfoRequestDTO) {
		return openBankingApiClient.findUser(userInfoRequestDTO);
	}
	
	// 등록계좌조회
//	public AccountResponseDTO findAccount(AccountRequestDTO accountRequestDTO) {
//		return openBankingApiClient.findAccount(accountRequestDTO);
//	}
}
