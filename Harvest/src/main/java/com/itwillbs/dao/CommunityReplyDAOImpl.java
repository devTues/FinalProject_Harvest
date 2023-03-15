package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CommunityReplyDTO;

@Repository
public class CommunityReplyDAOImpl implements CommunityReplyDAO{
	
	private static final String namespace = "com.itwillbs.mappers.communityReplyMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertReply(CommunityReplyDTO communityReplyDTO) {
		sqlSession.insert(namespace + ".insertReply", communityReplyDTO);
	}

	@Override
	public List<CommunityReplyDTO> getCommunityReplyList(CommunityReplyDTO communityReplyDTO) {
		return sqlSession.selectList(namespace + ".getCommunityReplyList", communityReplyDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum2");
	}

	


}
