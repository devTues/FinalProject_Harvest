package com.itwillbs.openbank.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.openbank.domain.AccountRequestDTO;
import com.itwillbs.openbank.domain.AccountResponseDTO;
import com.itwillbs.openbank.domain.RequestTokenDTO;
import com.itwillbs.openbank.domain.ResponseTokenDTO;

@Service
public class OpenBankingService {
	// 객체생성
	@Inject
	private OpenBankingApiClient openBankingApiClient;
	
	// 토큰 발급 요청
	public ResponseTokenDTO requestToken(RequestTokenDTO requestTokenDTO) {
		return openBankingApiClient.requestToken(requestTokenDTO);
	}
	
	// 등록계좌조회
	public AccountResponseDTO findAccount(AccountRequestDTO accountRequestDTO) {
		return openBankingApiClient.findAccount(accountRequestDTO);
	}
}
