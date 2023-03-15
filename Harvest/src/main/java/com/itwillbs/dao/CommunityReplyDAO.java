package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.CommunityReplyDTO;

public interface CommunityReplyDAO {

	public void insertReply(CommunityReplyDTO communityReplyDTO);
	
	public List<CommunityReplyDTO> getCommunityReplyList(CommunityReplyDTO communityReplyDTO);

	public Integer getMaxNum();

}
