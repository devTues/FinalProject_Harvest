package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AddressDTO;

@Repository
public class AddressDAOImpl implements AddressDAO  {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.AddressMapper";
	
	@Override
	public List<AddressDTO> getAddressList(String id) {
		return sqlSession.selectList(namespace+".getAddressList", id);
	}
	
	@Override
	public void insertAddress(AddressDTO addressDto) {
		sqlSession.insert(namespace+".insertAddress", addressDto);
	}

	@Override
	public Integer getMaxIdx() {
		return sqlSession.selectOne(namespace+".getMaxIdx");
	}

	@Override
	public void deleteAddress(AddressDTO addressDto) {
		sqlSession.delete(namespace+".deleteAddress", addressDto);
	}

	@Override
	public Integer getAddressCount(String id) {
		return sqlSession.selectOne(namespace+".getAddressCount",id);
	}
	
	@Override
	public List<AddressDTO> getAddress(String id) {
		return sqlSession.selectList(namespace+".getAddress",id);
	}

}
