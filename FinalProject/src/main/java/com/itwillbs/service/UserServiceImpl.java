package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.UserDAO;
import com.itwillbs.dao.UserDAOImpl;
import com.itwillbs.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject	// 부모 = 자식 객체생성
	private UserDAO userDAO;

	@Override
	public UserDTO userCheck(UserDTO userDto) {
		return userDAO.userCheck(userDto);
	}
	
	
}
