package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectDTO;

@Repository
public class ProjectInfoDAOImpl implements ProjectInfoDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.projectInfoMapper";

	@Override
	public List<ProjectDTO> getProjectList() {
		List<ProjectDTO> projectList = sqlSession.selectList(namespace + ".getProjectList");
		return projectList;
	}

	@Override
	public ProjectDTO getProjectInfo(Map<String, String> param) {
		return sqlSession.selectOne(namespace + ".getProjectInfo", param);
	}

	@Override
	public String getLike(Map<String, String> param) {
		List<Map<String, String>> map = sqlSession.selectList(namespace + ".getLike", param);
		
		
		return String.valueOf(map.get(0).get("CNT"));
	}
	
	@Override
	public int setLike(Map<String, String> param) {
		return sqlSession.insert(namespace + ".insertLike", param);
	}

	@Override
	public int delLike(Map<String, String> param) {
		return sqlSession.delete(namespace + ".delLike", param);
	}

//	@Override
//	public int getSumMoney(int idx) {
//		return sqlSession.selectOne(namespace + ".getSumMoney", idx);
//	}

	@Override
	public int getSumUser(Map<String, String> param) {
		return sqlSession.selectOne(namespace + ".getSumUser", param);
	}

	@Override
	public int getSumMoney(Map<String, String> param) {
		return sqlSession.selectOne(namespace + ".getSumMoney", param);
	}
}
