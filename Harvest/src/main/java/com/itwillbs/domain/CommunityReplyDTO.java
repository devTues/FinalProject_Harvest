package com.itwillbs.domain;

import java.sql.Timestamp;

public class CommunityReplyDTO {

	private int idx;
	private int commIdx;
	private int pjIdx;
	private String name;
	private String profile;
	private String id;
	private String content;
	private Timestamp date;
	private String contentLabel;
	// 스폰 여부 추가로 조회했음
	private String spon;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCommIdx() {
		return commIdx;
	}
	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}
	public int getPjIdx() {
		return pjIdx;
	}
	public void setPjIdx(int pjIdx) {
		this.pjIdx = pjIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getContentLabel() {
		return contentLabel;
	}
	public void setContentLabel(String contentLabel) {
		this.contentLabel = contentLabel;
	}
	public String getSpon() {
		return spon;
	}
	public void setSpon(String spon) {
		this.spon = spon;
	}
	
	

}
