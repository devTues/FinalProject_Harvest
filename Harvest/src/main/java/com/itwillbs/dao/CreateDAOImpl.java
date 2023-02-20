package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectDTO;


@Repository
public class CreateDAOImpl implements CreateDAO {

	@Inject
	private SqlSession sqlSession;
	private String namespace = "com.itwillbs.mappers.createMapper";

//	@Override
//	public void insertProject(Map<String, String> projectMap) {
//		sqlSession.insert(namespace + ".insertProject", projectMap);		
//	}

	@Override
	public void insertProject(ProjectDTO projectDto) {
		sqlSession.insert(namespace + ".insertProject", projectDto);
	}
	
	@Override
	public List<String> getCategoryList() {
		return sqlSession.selectList(namespace + ".getCategoryList");
	}


	
	
	
	
	
	
}
