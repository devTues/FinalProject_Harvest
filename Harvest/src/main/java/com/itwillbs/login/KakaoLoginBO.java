package com.itwillbs.login;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class KakaoLoginBO {
	
	/*인증 요청문을 구성하는 파라미터*/
	//client_id(= REST_API): 애플리케이션 등록 후 발급받은 클라이언트 아이디
	//response_type: 인증 과정에 대한 구분값, code로 값이 고정
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩)애플리케이션을 등록할 때 callback URL에 설정한 정보
	//state: 애플리케이션이 생성한 상태 토큰
	
	// 카카오 로그인 정보
	private final static String KAKAO_CLIENT_ID = "620fc413b90f2dc2d95959ec87e44bd9";
	private final static String KAKAO_CLIENT_SECRET = "hLh2JM9yzo7MtF7tHVgGj9BoNg9NT5Ge";
	private final static String KAKAO_REDIRECT_URI = "http://localhost:8080/myweb/Kakao/kakaoLoginSuccess";  //Redirect URL
	private final static String SESSION_STATE = "oauth_state_kakao";
	/*프로필 조회 API URL*/
	private final static String PROFILE_API_URL	= "https://kapi.kakao.com/v2/user/me";

	
	/*카카오 아이디로 인증 URL 생성 Method*/
	public String getAuthorizationUrl(HttpSession session) {
		
		/*세션 유효성 검증을 위하여 난수를 생성*/
		String state = generateRandomString();
		/*생성한 난수 값을 session에 저장*/
		setSession(session, state);
		
		/*Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 카아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()
			.apiKey(KAKAO_CLIENT_ID)
			.apiSecret(KAKAO_CLIENT_SECRET)
			.callback(KAKAO_REDIRECT_URI)
			.state(state).build(KakaoOAuthApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
		String sessionState = getSession(session);
		System.out.println(sessionState + "카카오 세션스테이ㅡ트");
		System.out.println(state + "카카오 스테이드");
		if(StringUtils.pathEquals(sessionState, state)) {
			
			OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(KAKAO_REDIRECT_URI)
				.state(state)
				.build(KakaoOAuthApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	/*세션 유효성 검증을 위한 난수 생성기*/
	private String generateRandomString() {
		
		return UUID.randomUUID().toString();
	}

	/*http session에 데이터 저장*/
	private void setSession(HttpSession session, String state) {
		
		session.setAttribute(SESSION_STATE, state);
	}

	/*http session에서 데이터 가져오기*/
	private String getSession(HttpSession session) {
		
		return (String)session.getAttribute(SESSION_STATE);
	}
	
	
	/*Access Token을 이용하여 카카오 사용자 프로필 API를 호출*/
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
		
		OAuth20Service oauthService = new ServiceBuilder()
			.apiKey(KAKAO_CLIENT_ID)
			.apiSecret(KAKAO_CLIENT_SECRET)
			.callback(KAKAO_REDIRECT_URI)
			.build(KakaoOAuthApi.instance());

		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		
		return response.getBody();
	}



}


