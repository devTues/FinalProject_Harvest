package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.UserDAO;
import com.itwillbs.domain.UserDTO;


@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO userDAO;

	@Override
	public void insertUser(UserDTO userDTO) {
		if(userDAO.getMaxNum()==null) {
			// ���� ���� ���
			userDTO.setNum(1);
		} else {
			userDTO.setNum(userDAO.getMaxNum()+1);
		}
		userDAO.insertUser(userDTO);
		
	}

	@Override
	public UserDTO userCheck(UserDTO userDTO) {
		return userDAO.userCheck(userDTO);
	}

	@Override
	public UserDTO getUser(String id) {
		return userDAO.getUser(id);
	}

	@Override
	public void updateUser(UserDTO userDTO) {
		userDAO.updateUser(userDTO);
	}

}
