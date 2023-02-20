package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CreateDAO;
import com.itwillbs.domain.ProjectDTO;

@Service
public class CreateServiceImpl implements CreateService {

	@Inject
	private CreateDAO createDAO;

//	@Override
//	public void insertProject(Map<String, String> projectMap) {
//		projectDAO.insertProject(projectMap);
//	}
	

	@Override
	public void insertProject(ProjectDTO projectDto) {
		createDAO.insertProject(projectDto);
	}
	
	@Override
	public List<String> getCategoryList() {
		return createDAO.getCategoryList();
	}

	
}
