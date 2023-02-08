package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProjectDAO;
import com.itwillbs.domain.ProjectDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Inject
	private ProjectDAO projectDAO;

	@Override
	public void insertProject(ProjectDTO projectDto) {
		projectDAO.insertProject(projectDto);
	}
	
	
}
