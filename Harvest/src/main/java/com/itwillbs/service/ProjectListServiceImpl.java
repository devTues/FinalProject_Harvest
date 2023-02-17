package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProjectListDAO;
import com.itwillbs.domain.ProjectDTO;

@Service
public class ProjectListServiceImpl implements ProjectListService{
	
	@Inject
	private ProjectListDAO projectListDAO;
	
	@Override
	public List<ProjectDTO> getProjectList(Map<String, String> param) {
		return projectListDAO.getProjectList(param);
	}
	@Override
	public int getCount(Map<String, String> param) {
		return projectListDAO.getCount(param);
	}

	@Override
	public List<ProjectDTO> getExpectList(Map<String, String> param) {
		return projectListDAO.getExpectList(param);
	}
	
	

	
	
	

	

	
}
