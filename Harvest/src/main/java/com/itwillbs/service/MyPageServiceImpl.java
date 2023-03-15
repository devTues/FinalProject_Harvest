package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MyPageDAO;
import com.itwillbs.domain.UserDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject	
	private MyPageDAO myPageDAO;

	@Override
	public void insertMember(UserDTO userDto) {
		myPageDAO.insertUser(userDto);
	}

	@Override
	public UserDTO userCheck(UserDTO userDto) {
		return myPageDAO.userCheck(userDto);
	}

	@Override
	public UserDTO getUser(String id) {
		return myPageDAO.getUser(id);
	}

	@Override
	public void updateUser(Map<String, String> param) {
		System.out.println("MyPageServiceImple - updateUser() 메서드");
		myPageDAO.updateUser(param);
	}
	
	@Override
	public void deleteUser(UserDTO usetDto) {
		myPageDAO.deleteUser(usetDto);
	}
	
	// 알람
	@Override
	public List<Map<String, String>> getMyAlarmList(String id) {
		return myPageDAO.getMyAlarmList(id);
	}
	
	// 창작
	@Override
	public List<Map<String, String>> getMyCreateList(String id) {
		return myPageDAO.getMyCreateList(id);
	}

	@Override
	public int getMyCreateCount(String id) {
		return myPageDAO.getMyCreateCount(id);
	}
	
	// 찜
	@Override
	public List<Map<String, String>> getMyFavoriteList(String id) {
		return myPageDAO.getMyFavoriteList(id);
	}

	@Override
	public int getMyFavoriteCount(String id) {
		return myPageDAO.getMyFavoriteCount(id);
	}
	
	// 후원
	@Override
	public List<Map<String, String>> getMySupportList(String id) {
		return myPageDAO.getMySupportList(id);
	}

	@Override
	public int getMySupportCount(String id) {
		return myPageDAO.getMySupportCount(id) ;
	}

}
