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
	public List<Map<String, String>> getProjectList(String id) {
		return createDAO.getProjectList(id);
	}

	@Override
	public Map<String, String> getProject(int idx) {
		return createDAO.getProject(idx);
	}

	@Override
	public void insertProject(ProjectDTO projectDto) {
		createDAO.insertProject(projectDto);
	}
	
//	@Override
	public void insertPlan(ProjectDTO projectDto) {
//		if(projectDto.getIdx() == 0) {
//			projectDto.setIdx(createDAO.getMax() + 1);
//		}
//		createDAO.insertProject(projectDto);
	}

	@Override
	public void insertFunding(ProjectDTO projectDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> getCategoryList() {
		return createDAO.getCategoryList();
	}

	
}
