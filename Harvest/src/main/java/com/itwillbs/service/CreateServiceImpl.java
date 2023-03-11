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

	@Override
	public List<Map<String, String>> getProjectList(Map<String, String> projectMap) {
		return createDAO.getProjectList(projectMap);
	}

	@Override
	public int getCount() {
		return createDAO.getCount();
	}
	
	@Override
	public Map<String, String> getProject(int idx) {
		return createDAO.getProject(idx);
	}

	@Override
	public void insertProject(ProjectDTO projectDto) {
		createDAO.insertProject(projectDto);
	}
	

	@Override
	public List<String> getCategoryList() {
		return createDAO.getCategoryList();
	}

	
}
