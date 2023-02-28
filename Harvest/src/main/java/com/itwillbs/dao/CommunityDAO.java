package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CommunityDTO;

public interface CommunityDAO {

	public List<CommunityDTO> getComm1List(CommunityDTO communityDTO);
	
//	public List<CommunityDTO> getComm2List(CommunityDTO dto);
//	
//	public List<CommunityDTO> getComm3List(CommunityDTO dto);
	
	public void insertBoard(CommunityDTO communityDTO);

	public Integer getMaxNum(CommunityDTO communityDTO);
	
	public void deleteBoard(int num);


}
