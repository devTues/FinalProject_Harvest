package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject 
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.userMapper";

	@Override
	public void insertUser(UserDTO userDTO) {
		sqlSession.insert(namespace + ".insertUser", userDTO); 
	}
	
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public UserDTO userCheck(UserDTO userDTO) {
		return sqlSession.selectOne(namespace + ".userCheck", userDTO);
	}

	@Override
	public UserDTO getUser(String id) {
		return sqlSession.selectOne(namespace+".getUser", id);
	}

	@Override
	public void updateUser(UserDTO userDTO) {
		sqlSession.update(namespace+".updateUser", userDTO);
	}
	

}