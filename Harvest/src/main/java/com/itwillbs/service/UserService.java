package com.itwillbs.service;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.UserDTO;

public interface UserService {
	
//	[회원가입]
	public void insertUser(UserDTO userDto);
	
//  [회원가입 - 배송지 입력]
	public void insertAddress(AddressDTO profileDto);
	
////  [회원가입 - 프로필사진 등록]
//	public void insertProfile(MultipartFile file);
	
//	[로그인]
	public UserDTO userCheck(UserDTO userDto);
	
//	[회원 정보 가져오기]
	public UserDTO getUser(String id);
	
//	[비밀번호 가져오기]
	public UserDTO passCheck(UserDTO userDto);

	
}
