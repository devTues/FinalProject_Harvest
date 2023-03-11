package com.itwillbs.openbank.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.openbank.domain.RequestTokenDTO;
import com.itwillbs.openbank.domain.ResponseTokenDTO;
import com.itwillbs.openbank.domain.UserInfoRequestDTO;
import com.itwillbs.openbank.domain.UserInfoResponseDTO;

@Service
public class OpenBankingApiClient {
	
	private final static String client_id = "d074c396-c90b-460c-a607-ca735cf4cdf3";
	private final static String client_secret = "fc771d23-e773-4b28-9135-96bb38eee6dc";
	
	// 토큰발급 메서드
	public ResponseTokenDTO requestToken(RequestTokenDTO requestTokenDTO) {
//		요청 메시지 URL
//		HTTP URL https://testapi.openbanking.or.kr/oauth/2.0/token
//		HTTP Method POST
//		Content-Type application/x-www-form-urlencoded; charset=UTF-8
		System.out.println("클라이언트 옴");
		// 주소줄에 값을 넘김 주소 이름=값
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// 토큰 발급 => code, client_id, client_secret, redirect_uri,  grant_type
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("code", requestTokenDTO.getCode());
		parameters.add("client_id", client_id);	
		parameters.add("client_secret", client_secret);	
		parameters.add("redirect_uri", "http://localhost:8080/fintech/callback");
		parameters.add("grant_type", "authorization_code");
		
		// header, parameters
		HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		// REST 방식 API 요청 리턴받은 값
		RestTemplate restTemplate = new RestTemplate();
		String apiUrl = "https://testapi.openbanking.or.kr/oauth/2.0/token";
//		return restTemplate.exchange(API주소, Method 방식, 파라미터 값, 응답할 값);
		return restTemplate.exchange(apiUrl, HttpMethod.POST, param, ResponseTokenDTO.class).getBody();
	}
	
	// 사용자 정보 조회
	public UserInfoResponseDTO findUser(UserInfoRequestDTO userInfoRequestDTO) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "Bearer" + userInfoRequestDTO.getAccess_token());
		
		// header, parameters
		HttpEntity<String> param = new HttpEntity<String>(httpHeaders);
		
		// GET 방식일 때 파라미터값 가지고 가는 방식
		String apiUrl = "https://testapi.openbanking.or.kr/v2.0/user/me";
		UriComponents uriBulder = UriComponentsBuilder.fromHttpUrl(apiUrl).queryParam("user_seq_no", userInfoRequestDTO.getUser_seq_no()).build();
				
		// REST 방식 API 요청 리턴받은 값
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.exchange(uriBulder.toString(), HttpMethod.GET, param, UserInfoResponseDTO.class).getBody();
	}
//	
	// 등록계좌조회
//	public AccountResponseDTO findAccount(AccountRequestDTO accountRequestDTO) {
//		HttpHeaders httpHeaders = new HttpHeaders();
//		httpHeaders.add("Authorization", "Bearer" + accountRequestDTO.getAccess_token());
//		
//		// header, parameters
//		HttpEntity<String> param = new HttpEntity<String>(httpHeaders);
//		
//		// GET 방식일 때 파라미터값 가지고 가는 방식
//		String apiUrl = "https://testapi.openbanking.or.kr/v2.0/user/me";
//		UriComponents uriBulder = UriComponentsBuilder.fromHttpUrl(apiUrl).queryParam("user_seq_no", accountRequestDTO.getUser_seq_no())
//																		  .queryParam("include_cancel_yn", accountRequestDTO.getInclude_cancel_yn())
//																		  .queryParam("sort_order", accountRequestDTO.getSort_order()).build();
//		// REST 방식 API 요청 리턴받은 값
//		RestTemplate restTemplate = new RestTemplate();
//		return restTemplate.exchange(uriBulder.toString(), HttpMethod.GET, param, AccountResponseDTO.class).getBody();
//	
//	}
}
