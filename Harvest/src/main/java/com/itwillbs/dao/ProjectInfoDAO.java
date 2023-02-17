package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectDTO;

public interface ProjectInfoDAO {
	public List<ProjectDTO> getProjectList();
	public ProjectDTO getProjectInfo(Map<String, String> param);
	public String getLike(Map<String, String> param);
	public int setLike(Map<String, String> param);
	public int delLike(Map<String, String> param);
	public int getSumMoney(Map<String, String> param);
	public int getSumUser(Map<String, String> param);
}
