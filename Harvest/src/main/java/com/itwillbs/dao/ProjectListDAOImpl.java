package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectDTO;

@Repository
public class ProjectListDAOImpl implements ProjectListDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.projectListMapper";

	@Override
	public List<ProjectDTO> getProjectList(Map<String, String> param) {
		return sqlSession.selectList(namespace + ".getProjectList", param);
	}
	
	@Override
	public int getCount(Map<String, String> param) {
		return sqlSession.selectOne(namespace+".getCount", param);
	}
	

	@Override
	public List<ProjectDTO> getExpectList(Map<String, String> param) {
		return sqlSession.selectList(namespace+".getExpectList", param);
	}

	
	
	
	

}
