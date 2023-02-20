package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectDTO;

public interface CreateDAO {
//	public void insertProject(Map<String, String> projectMap);
	public void insertProject(ProjectDTO projectDto);
	public List<String> getCategoryList();
}
