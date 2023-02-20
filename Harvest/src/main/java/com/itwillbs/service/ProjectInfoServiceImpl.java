package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProjectInfoDAO;
import com.itwillbs.domain.ProjectDTO;

@Service
public class ProjectInfoServiceImpl implements ProjectInfoService{
	
	@Inject
	private ProjectInfoDAO projectDAO;

	@Override
	public List<ProjectDTO> getProjectList() {
		return projectDAO.getProjectList();
	}

	@Override
	public ProjectDTO getProjectInfo(Map<String, String> param) {
		return projectDAO.getProjectInfo(param);
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

//	@Override
//	public int getSumUser(int idx) {
//		return projectDAO.getSumUser(idx);
//	}

//	@Override
//	public int getSumMoney(Map<String, String> param) {
//		return projectDAO.getSumMoney(param);
//	}
//
//	@Override
//	public int getSumUser(Map<String, String> param) {
//		return projectDAO.getSumUser(param);
//	}
	
	
}
