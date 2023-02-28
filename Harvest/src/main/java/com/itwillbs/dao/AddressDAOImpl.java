package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AddressDTO;

@Repository
public class AddressDAOImpl implements AddressDAO  {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.addressMapper";
	
	@Override
	public void insertAddress(AddressDTO addressDTO) {
		sqlSession.insert(namespace+".insertAddress", addressDTO);
		
	}
	
	
	
	
	
	

}
