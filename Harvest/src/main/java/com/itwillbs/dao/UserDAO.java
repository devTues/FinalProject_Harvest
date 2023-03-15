package com.itwillbs.dao;

import com.itwillbs.domain.UserDTO;

public interface UserDAO {

	public void insertUser(UserDTO userDto);
	
	public UserDTO userCheck(UserDTO userDto);
	
	public UserDTO getUser(String id);
	
	public UserDTO passCheck(UserDTO userDto);

}
