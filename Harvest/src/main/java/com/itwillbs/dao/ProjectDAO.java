package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectDTO;

public interface ProjectDAO {
	public List<ProjectDTO> getProjectList();
	public ProjectDTO getProjectInfo(Map<String, String> param);
	public String getLike(Map<String, String> param);
	public int setLike(Map<String, String> param);
	public int delLike(Map<String, String> param);
	
	public String getAlram(Map<String, String> param);
	public int setAlram(Map<String, String> param);
	public int delAlram(Map<String, String> param);
}
