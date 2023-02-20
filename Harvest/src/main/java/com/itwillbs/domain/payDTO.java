package com.itwillbs.domain;

public class payDTO {
	
	private String PID; // 후원자ID
	private String PTITLE; // 후원한 프로젝트명
	private int AMOUNT; // 후원금액(결제금액)
	private String PSTATUS; // 결제상태
	
	// join했을때 필요한 프로젝트 컬럼들.
	private String IDX; 
	private String FUNDSTATUS;
	
	
	
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getFUNDSTATUS() {
		return FUNDSTATUS;
	}
	public void setFUNDSTATUS(String fUNDSTATUS) {
		FUNDSTATUS = fUNDSTATUS;
	}
	public String getPID() {
		return PID;
	}
	public void setPID(String pID) {
		PID = pID;
	}
	public String getPTITLE() {
		return PTITLE;
	}
	public void setPTITLE(String pTITLE) {
		PTITLE = pTITLE;
	}
	public int getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(int aMOUNT) {
		AMOUNT = aMOUNT;
	}
	public String getPSTATUS() {
		return PSTATUS;
	}
	public void setPSTATUS(String pSTAUS) {
		PSTATUS = pSTAUS;
	}

}
