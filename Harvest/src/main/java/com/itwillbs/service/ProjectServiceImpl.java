package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProjectDAO;
import com.itwillbs.domain.ProjectDTO;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Inject
	private ProjectDAO projectDAO;

	@Override
	public List<ProjectDTO> getProjectList() {
		return projectDAO.getProjectList();
	}

	@Override
	public String setLike(Map<String, String> param) {
		String cnt = projectDAO.getLike(param);
		String result = "";
		if(cnt.equals("0")) {
			projectDAO.setLike(param);
			result = "heart_fill.svg";
		} else {
			projectDAO.delLike(param);
			result = "heart.svg";
		}
		return result;
	}
	
	@Override
	public String setAlram(Map<String, String> param) {
		String cnt = projectDAO.getAlram(param);
		String result = "";
		if(cnt.equals("0")) {
			projectDAO.setAlram(param);
			result = "alram_fill.svg";
		} else {
			projectDAO.delAlram(param);
			result = "alram.svg";
		}
		return result;
	}

	
}
