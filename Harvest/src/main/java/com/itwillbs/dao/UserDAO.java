package com.itwillbs.dao;

import com.itwillbs.domain.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO userDTO);
	public Integer getMaxNum();
	public UserDTO userCheck(UserDTO userDTO);
	public UserDTO getUser(String id);
	public void updateUser(UserDTO userDTO);

}
