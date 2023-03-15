package com.itwillbs.dao;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	// 마이바티스 객체 생성(root-context.xml에 있는 마이바티스 객체)을 멤버변수에 자동으로 전달받아 사용
	@Inject 
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.userMapper";

	
	@Override
	public void insertUser(UserDTO userDto) {
		
		sqlSession.insert(namespace + ".insertUser", userDto); 
	}

	
	@Override
	public UserDTO userCheck(UserDTO userDto) {
		
		return sqlSession.selectOne(namespace + ".userCheck", userDto);
	}
	
	
	@Override
	public UserDTO getUser(String id) {
		
		return sqlSession.selectOne(namespace + ".getUser", id);
	}


	@Override
	public UserDTO passCheck(UserDTO userDto) {

		return sqlSession.selectOne(namespace + ".passCheck", userDto);
	}


	
	
	

}
