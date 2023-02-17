package com.itwillbs.domain;

public class RegisterRequest {
	
	private String name;
	private String id;
	private String pass;
	private String eventSt;
	
//	 비밀번호 확인
//	public boolean inPwEqualToCheckPw() {
//		return pw.equals(checkPw);
//	}
	
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
	public String getEventSt() {
		return eventSt;
	}
	public void setEventSt(String eventSt) {
		this.eventSt = eventSt;
	}
	
	
	

}
