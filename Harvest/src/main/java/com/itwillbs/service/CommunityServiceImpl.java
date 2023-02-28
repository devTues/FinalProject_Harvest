package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CommunityDAO;
import com.itwillbs.domain.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	private CommunityDAO communityDAO;


	@Override
	public List<CommunityDTO> getComm1List(CommunityDTO communityDTO) {
		return communityDAO.getComm1List(communityDTO);
	}

//	@Override
//	public List<CommunityDTO> getComm2List(CommunityDTO dto) {
//		return communityDAO.getComm2List(dto);
//	}
//
//	@Override
//	public List<CommunityDTO> getComm3List(CommunityDTO dto) {
//		return communityDAO.getComm3List(dto);
//		
//	}

	@Override
	public void insertBoard(CommunityDTO communityDTO) {
		
		communityDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		if(communityDAO.getMaxNum(communityDTO) == null) {
			communityDTO.setIdx(1);
		
		} else {
			communityDTO.setIdx(communityDAO.getMaxNum(communityDTO) + 1);
		
		}
		
		communityDAO.insertBoard(communityDTO);
		
	}

	@Override
	public void deleteBoard(int num) {
		communityDAO.deleteBoard(num);
		
	}
	
	
	
	
	
	
	
}
