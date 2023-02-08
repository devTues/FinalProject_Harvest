package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
//import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	// 마이바티스 객체생성 => 멤버변수 자동 주입
	@Inject
	private SqlSession sqlSession;
	private String namespace = "com.itwillbs.mappers.UserMapper";
	
	@Override
	public UserDTO userCheck(UserDTO userDto) {
		return sqlSession.selectOne(namespace + ".userCheck", userDto);
	}

	
	
}
