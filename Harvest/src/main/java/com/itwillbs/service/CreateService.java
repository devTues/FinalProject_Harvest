package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectDTO;

public interface CreateService {
//	public void insertProject(Map<String, String> projectMap);
	public void insertProject(ProjectDTO projectDto);
	public List<String> getCategoryList();
}
