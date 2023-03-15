package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CommunityDTO;
import com.itwillbs.domain.PaymentDTO;

public interface CommunityDAO {

	public List<CommunityDTO> getComm1List(CommunityDTO communityDTO);
	
//	public List<CommunityDTO> getComm2List(CommunityDTO communityDTO);
//	
//	public List<CommunityDTO> getComm3List(CommunityDTO communityDTO);
	
	public void insertBoard(CommunityDTO communityDTO);

	public Integer getMaxNum();
	
	public void deleteBoard(int idx);
	
	public PaymentDTO getPaymentInfo(PaymentDTO paymentDTO);
	


}
