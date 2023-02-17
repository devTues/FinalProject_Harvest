package com.itwillbs.domain;

import java.sql.Date;

public class ProjectDTO {
	
	private int idx;
	private String creNm;
	private String category;
	private String title;
	private String img1;
	private String intro;
	private int targetAmt;
	private int totalAmt;
	private Date start;
	private Date end;
	private String heart;
	private String alram;
	private int count;
	
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCreNm() {
		return creNm;
	}
	public void setCreNm(String creNm) {
		this.creNm = creNm;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public int getTargetAmt() {
		return targetAmt;
	}
	public void setTargetAmt(int targetAmt) {
		this.targetAmt = targetAmt;
	}
	public int getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(int totalAmt) {
		this.totalAmt = totalAmt;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getAlram() {
		return alram;
	}
	public void setAlram(String alram) {
		this.alram = alram;
	}
	

	
	
	


}
