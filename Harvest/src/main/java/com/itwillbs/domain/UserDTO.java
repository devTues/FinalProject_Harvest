package com.itwillbs.domain;

import java.sql.Timestamp;

public class UserDTO {
	
	// 멤버변수
	private int idx;
	private String name;
	private String id;
	private String pass;
	private String profile;
	private String phone;
	private String prefer;
	private String unregist; //탈퇴여부
	private Timestamp unregDate; //탈퇴신청날짜
	private String eventAlr;
	
	private String codeNm;
	private String code;
	
	private String address;
	
	public int getIdx() {
		return idx;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
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
	public String getUnregist() {
		return unregist;
	}
	public void setUnregist(String unregist) {
		this.unregist = unregist;
	}
	public Timestamp getUnregDate() {
		return unregDate;
	}
	public void setUnregDate(Timestamp unregDate) {
		this.unregDate = unregDate;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "UserDTO [idx=" + idx + ", name=" + name + ", id=" + id + ", pass=" + pass + ", profile=" + profile
				+ ", phone=" + phone + ", prefer=" + prefer + ", unregist=" + unregist + ", unregDate=" + unregDate
				+ ", eventAlr=" + eventAlr + ", codeNm=" + codeNm + ", code=" + code + ", address=" + address + "]";
	}

	

}
