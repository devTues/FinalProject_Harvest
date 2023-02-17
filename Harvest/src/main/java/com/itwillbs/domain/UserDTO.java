package com.itwillbs.domain;

public class UserDTO {
	
	// 멤버변수
	private int idx;
	private String name;
	private String id;
	private String pass;
	private String phone;
	private String prefer;		//유저취향
	private String eventAlr;		//이벤트알람
//	private String authKey;		//이메일 인증키
//	private String authSt;		//이메일 인증상태(default 0 / 인증완료 시 1)
//	private String getEmail;	//이메일 인증
	
	
	// 멤버함수(메서드)
	// set() : 멤버변수에 외부의 데이터를 저장
	// get() : 외부에서 멤버변수 데이터를 가져다 사용
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPrefer() {
		return prefer;
	}
	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}
	
	
	public String getEventAlr() {
		return eventAlr;
	}
	public void setEventAlr(String eventAlr) {
		this.eventAlr = eventAlr;
	}
//	public String getAuthKey() {
//		return authKey;
//	}
//	public void setAuthKey(String authKey) {
//		this.authKey = authKey;
//	}
//	
//	public String getAuthSt() {
//		return authSt;
//	}
//	public void setAuthSt(String authSt) {
//		this.authSt = authSt;
//	}
	
	// 테스트
//	@Override
//	public String toString() {
//		return "UserDTO [idx=" + idx + ", name=" + name + ", id=" + id + ", pass=" + pass + ", phone=" + phone
//				+ ", prefer=" + prefer + ", eventAlr=" + eventAlr + ", authKey=" + authKey + ", authSt=" + authSt + "]";
//	}
	
//	public String getGetEmail() {
//		return getEmail;
//	}
//	public void setGetEmail(String getEmail) {
//		this.getEmail = getEmail;
//	}



}
