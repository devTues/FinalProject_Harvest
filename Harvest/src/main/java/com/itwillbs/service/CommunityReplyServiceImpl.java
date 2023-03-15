package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CommunityReplyDAO;
import com.itwillbs.domain.CommunityReplyDTO;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService{

	@Inject
	private CommunityReplyDAO communityReplyDAO;

	@Override
	public void insertReply(CommunityReplyDTO communityReplyDTO) {
		
		communityReplyDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		if(communityReplyDAO.getMaxNum() == null) {
			communityReplyDTO.setIdx(1);
		
		} else {
			communityReplyDTO.setIdx(communityReplyDAO.getMaxNum() + 1);
		
		}
		
		communityReplyDAO.insertReply(communityReplyDTO);
	}

	@Override
	public List<CommunityReplyDTO> getCommunityReplyList(CommunityReplyDTO communityReplyDTO) {
		return communityReplyDAO.getCommunityReplyList(communityReplyDTO);
	}

	
	

}
