package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductUpdateDTO {

	private int idx;
	private int pjIdx;
	private String id;
	private String creNm;
	private String crePro;
	private String content;
	private Timestamp date;
	
	
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCreNm() {
		return creNm;
	}
	public void setCreNm(String creNm) {
		this.creNm = creNm;
	}
	public String getCrePro() {
		return crePro;
	}
	public void setCrePro(String crePro) {
		this.crePro = crePro;
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
	
	
	
	
	
	

	
	
}
