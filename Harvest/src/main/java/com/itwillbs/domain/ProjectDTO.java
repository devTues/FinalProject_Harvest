package com.itwillbs.domain;

import java.sql.Date;

public class ProjectDTO {
	private int idx;
	private String id;
	private String creNm;
	private String crePro;
	private String creIntro;
	private String category;
	private String title;
	private String productNm;
	private String img1;
	private String intro;
	private String budget;
	private String schedule;
	private String minDona;
	private String targetAmt;
	private Date start;
	private Date end;
	private String status;
    private String spon;

    private int sumMoney;
    private int sumUser;
    private String heart;
    private String codeNm;
	
    
    
	public String getSpon() {
		return spon;
	}
	public void setSpon(String spon) {
		this.spon = spon;
	}
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
	String getProductNm() {
		return productNm;
	}
	void setProductNm(String productNm) {
		this.productNm = productNm;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
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
	public String getMinDona() {
		return minDona;
	}
	public void setMinDona(String minDona) {
		this.minDona = minDona;
	}
	public String getTargetAmt() {
		return targetAmt;
	}
	public void setTargetAmt(String targetAmt) {
		this.targetAmt = targetAmt;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(int sumMoney) {
		this.sumMoney = sumMoney;
	}
	public int getSumUser() {
		return sumUser;
	}
	public void setSumUser(int sumUser) {
		this.sumUser = sumUser;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	@Override
	public String toString() {
		return "ProjectDTO [idx=" + idx + ", id=" + id + ", creNm=" + creNm + ", crePro=" + crePro + ", creIntro="
				+ creIntro + ", category=" + category + ", title=" + title + ", productNm=" + productNm + ", img1="
				+ img1 + ", intro=" + intro + ", budget=" + budget + ", schedule=" + schedule + ", minDona=" + minDona
				+ ", targetAmt=" + targetAmt + ", start=" + start + ", end=" + end + ", status=" + status
				+ ", sumMoney=" + sumMoney + ", sumUser=" + sumUser + ", heart=" + heart + ", codeNm=" + codeNm + "]";
	}

	


	
}
