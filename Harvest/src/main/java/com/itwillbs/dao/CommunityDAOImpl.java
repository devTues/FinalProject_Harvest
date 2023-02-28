package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CommunityDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO{
	
	private static final String namespace = "com.itwillbs.mappers.communityMapper";
	
	@Inject
	private SqlSession sqlSession;


	@Override
	public List<CommunityDTO> getComm1List(CommunityDTO communityDTO) {
		return sqlSession.selectList(namespace + ".getComm1List", communityDTO);
	}

//	@Override
//	public List<CommunityDTO> getComm2List(CommunityDTO dto) {
//		return sqlSession.selectList(namespace + ".getComm2List", dto);
//	}
//
//	@Override
//	public List<CommunityDTO> getComm3List(CommunityDTO dto) {
//		return sqlSession.selectList(namespace + ".getComm3List", dto);
//	}

	@Override
	public void insertBoard(CommunityDTO communityDTO) {
		sqlSession.insert(namespace + ".insertBoard", communityDTO);
		
	}

	@Override
	public Integer getMaxNum(CommunityDTO communityDTO) {
		return sqlSession.selectOne(namespace + ".getMaxNum1", communityDTO);
	}

	@Override
	public void deleteBoard(int num) {
		sqlSession.delete(namespace + ".deleteBoard", num);
	}
	
	
	
	

	
	
	
}
