package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	private String namespace = "com.itwillbs.mappers.ProjectMapper";
	
	public void insertProject(ProjectDTO projectDto) {
		sqlSession.insert(namespace + ".insertProject", projectDto);
	}
	
	
}
