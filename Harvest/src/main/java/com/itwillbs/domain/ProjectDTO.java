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
	private String present;
	private String img1;
	private String img2;
	private String img3;
	private String intro;
	private String budget;
	private String schedule;
	private int minDona;
	private int targetAmt;
	private Date start;
	private Date end;
	private String status;
	
	private int sumMoney;
	private int sumUser;
	
	
	
	private String heart;
	
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
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
	public String getPresent() {
		return present;
	}
	public void setPresent(String present) {
		this.present = present;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
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

	
}
