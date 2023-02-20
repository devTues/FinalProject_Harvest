package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectDTO;


public interface ProjectListService {
	
	public List<Map<String, Object>> getProjectList(Map<String, Object> param);	
	public int getCount(Map<String, String> param);
	
	public List<ProjectDTO> getExpectList(Map<String, String> param);
	

	
	
	
	

}
