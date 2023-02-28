package com.itwillbs.domain;

import java.sql.Timestamp;

public class CommunityDTO {
	
	private int idx;
	private int pjIdx;
	private String name;
	private String profile;
	private String id;
	private String content;
	private String imgA;
	private String imgB;
	private String imgC;
	private Timestamp date;
	private String contentLabel;
	

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getImgA() {
		return imgA;
	}
	public void setImgA(String imgA) {
		this.imgA = imgA;
	}
	public String getImgB() {
		return imgB;
	}
	public void setImgB(String imgB) {
		this.imgB = imgB;
	}
	public String getImgC() {
		return imgC;
	}
	public void setImgC(String imgC) {
		this.imgC = imgC;
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
	

	
	
	
	
	
	
}
