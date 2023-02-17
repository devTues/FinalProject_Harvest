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
		System.out.println("UserDAOImpl insertUser()");
		
		sqlSession.insert(namespace + ".insertUser", userDto); 
	}

	
	@Override
	public UserDTO userCheck(UserDTO userDto) {
		System.out.println("UserDAOImpl userCheck()");
		
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



	
//	@Override
//	public UserDTO mailCheck(UserDTO dto) {
//
//		return sqlSession.selectOne(namespace + ".mailCheck", dto);
//	}

	
//	@Override
//	public void updatePass(UserDTO dto) {
//		
//		sqlSession.update(namespace + ".updateMember", dto);
//	}



	
	

}
