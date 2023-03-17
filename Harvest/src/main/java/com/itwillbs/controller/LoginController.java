package com.itwillbs.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwillbs.login.KakaoLoginBO;
import com.itwillbs.login.NaverLoginBO;


@Controller
public class LoginController {
/* 로그인 화면이 나타날 때 네이버,카카오 로그인 버튼에 로그인 인증 URL을 View로 보내주기 위해 Controller를 설정해준다.*/

	/*NaverLoginBO*/
	private NaverLoginBO naverLoginBO;
	private KakaoLoginBO kakaoLoginBO;
	private String apiResult = null;
	
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
		this.kakaoLoginBO = kakaoLoginBO;
	}


	// 로그인페이지
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/user/login", method = {RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/*네아로 인증 URL을 생성하기 위하여 naverLoginBO 클래스의 getAuthorizationUrl 메소드 호출*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		/*카아로 인증 URL을 생성하기 위하여 kakaoLoginBO 클래스의 getAuthorizationUrl 메서드 호출*/
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);

		/*인증요청문 확인(필수제공항목 동의 페이지)*/
		
		/*객체 바인딩*/
		model.addAttribute("urlNaver", naverAuthUrl);
		model.addAttribute("urlKakao", kakaoAuthUrl);

		/*생성한 인증 URL을 View로 전달*/
		return "user/loginForm";
	}
	

	// [네이버] 로그인 성공 시 callback 호출 메서드
	@RequestMapping(value = "/Naver/naverLoginSuccess", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;

		jsonObj = (JSONObject)jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject)jsonObj.get("response");

		// 프로필 조회
		String email = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");

		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
		session.setAttribute("signIn", apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		
		/*네이버 로그인 성공 페이지 View 호출*/
		return "redirect:/user/mainPage";
	}
	
	
	// [카카오] 로그인 성공 시 callback
	@RequestMapping(value = "/Kakao/kakaoLoginSuccess", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
		
		// 로그인 사용자 정보를 읽어온다.
		apiResult = kakaoLoginBO.getUserProfile(oauthToken);
	
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
	
		jsonObj = (JSONObject)jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject)jsonObj.get("kakao_account");
		JSONObject response_obj2 = (JSONObject)response_obj.get("profile");
		
		// 프로필 조회
		String email = (String)response_obj.get("email");
		String name = (String)response_obj2.get("name");
	
		// 세션에 사용자 정보 등록
		//  session.setAttribute("islogin_r", "Y");
		session.setAttribute("signIn", apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
	
		/*카카오 로그인 성공 페이지 View 호출*/
		return "redirect:/user/mainPage";
	}

	
	

}


