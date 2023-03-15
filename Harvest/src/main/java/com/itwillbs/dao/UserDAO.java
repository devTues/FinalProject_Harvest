package com.itwillbs.dao;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.UserDTO;

public interface UserDAO {

	public void insertUser(UserDTO userDto); 		   // [회원가입]
	
	public void insertAddress(AddressDTO addressDto);  //[배송지 입력]
	
	public UserDTO userCheck(UserDTO userDto);
	
	public UserDTO getUser(String id);
	
	public UserDTO passCheck(UserDTO userDto);

}
