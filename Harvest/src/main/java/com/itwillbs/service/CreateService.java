package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectDTO;

public interface CreateService {
	public List<Map<String, String>> getProjectList(String id);
	public Map<String, String> getProject(int idx);
	public void insertProject(ProjectDTO projectDto);
	public void insertPlan(ProjectDTO projectDto);
	public void insertFunding(ProjectDTO projectDto);
	public List<String> getCategoryList();
}
