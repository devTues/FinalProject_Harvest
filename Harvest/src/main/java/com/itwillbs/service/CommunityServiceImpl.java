package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CommunityDAO;
import com.itwillbs.domain.CommunityDTO;
import com.itwillbs.domain.PaymentDTO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	private CommunityDAO communityDAO;


	@Override
	public List<CommunityDTO> getComm1List(CommunityDTO communityDTO) {
		return communityDAO.getComm1List(communityDTO);
	}

//	@Override
//	public List<CommunityDTO> getComm2List(CommunityDTO communityDTO) {
//		return communityDAO.getComm2List(communityDTO);
//	}
//
//	@Override
//	public List<CommunityDTO> getComm3List(CommunityDTO communityDTO) {
//		return communityDAO.getComm3List(communityDTO);
//		
//	}

	@Override
	public void insertBoard(CommunityDTO communityDTO) {
		
		communityDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		if(communityDAO.getMaxNum() == null) {
			communityDTO.setIdx(1);
		
		} else {
			communityDTO.setIdx(communityDAO.getMaxNum() + 1);
		
		}
		
		communityDAO.insertBoard(communityDTO);
		
	}

	@Override
	public void deleteBoard(int idx) {
		communityDAO.deleteBoard(idx);
	}


	@Override
	public PaymentDTO getPaymentInfo(PaymentDTO paymentDTO) {
		return communityDAO.getPaymentInfo(paymentDTO);
	}
	
	

	
	
	
	
	
	
	
	
}
