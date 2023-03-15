package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.UserDTO;

public interface MyPageService {
	
	public void insertMember(UserDTO userDto);
	
	public UserDTO userCheck(UserDTO userDto);
	
	public UserDTO getUser(String id);
	
	public void updateUser(Map<String, String> param);
	
	public void deleteUser(UserDTO usetDto);
	
	// 알람
	public List<Map<String, String>> getMyAlarmList(String id);
	
	// 내가 만든 프로젝트
	public List<Map<String, String>> getMyCreateList(String id);
	
	public int getMyCreateCount(String id);
	
	// 찜
	public List<Map<String, String>> getMyFavoriteList(String id);
	
	public int getMyFavoriteCount(String id);
	
	// 후원
	public List<Map<String, String>> getMySupportList(String id);
	
	public int getMySupportCount(String id);
}
