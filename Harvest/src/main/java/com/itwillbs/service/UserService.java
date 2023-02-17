package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;

public interface UserService {

	public void insertUser(UserDTO userDTO);
	public UserDTO userCheck(UserDTO userDTO);
	public UserDTO getUser(String id);
	public void updateUser(UserDTO userDTO);

}
