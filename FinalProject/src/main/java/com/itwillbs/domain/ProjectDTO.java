package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProjectDTO {
	private int idx;
	private String id;
	private String creNm;
	private String crePro;
	private String creIntro;
	private String category;
	private String title;
	private String productNm;
	private String img;
	private String intro;
	private String budget;
	private String schedule;
	private int minDona;
	private int targetAmt;
	private Timestamp start;
	private Timestamp end;
	private String status;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getCreIntro() {
		return creIntro;
	}
	public void setCreIntro(String creIntro) {
		this.creIntro = creIntro;
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
	public String getProductNm() {
		return productNm;
	}
	public void setProductNm(String productNm) {
		this.productNm = productNm;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public int getMinDona() {
		return minDona;
	}
	public void setMinDona(int minDona) {
		this.minDona = minDona;
	}
	public int getTargetAmt() {
		return targetAmt;
	}
	public void setTargetAmt(int targetAmt) {
		this.targetAmt = targetAmt;
	}
	public Timestamp getStart() {
		return start;
	}
	public void setStart(Timestamp start) {
		this.start = start;
	}
	public Timestamp getEnd() {
		return end;
	}
	public void setEnd(Timestamp end) {
		this.end = end;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
