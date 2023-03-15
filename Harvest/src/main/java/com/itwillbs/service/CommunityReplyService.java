package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.CommunityReplyDTO;

public interface CommunityReplyService {

	public void insertReply(CommunityReplyDTO communityReplyDTO);

	public List<CommunityReplyDTO> getCommunityReplyList(CommunityReplyDTO communityReplyDTO);

}
