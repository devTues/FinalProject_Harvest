package com.itwillbs.domain;

import java.sql.Timestamp;

public class NoticeDTO {
	private int IDX;
	private String ID;
	private String TITLE;
	private String CONTENT;
	private Timestamp DATE;
	
	public int getIDX() {
		return IDX;
	}
	public void setIDX(int iDX) {
		IDX = iDX;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public Timestamp getDATE() {
		return DATE;
	}
	public void setDATE(Timestamp dATE) {
		DATE = dATE;
	}
	
	

	
	
}
