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
	private String namespace = "com.itwillbs.mappers.CreateMapper";

	@Override
	public List<Map<String, String>> getProjectList(String id) {
		return sqlSession.selectList(namespace + ".getProjectList", id);
	}
	
	@Override
	public Map<String, String> getProject(int idx) {
		return sqlSession.selectOne(namespace + ".getProject", idx);
	}

	@Override
	public int getMax() {
		return sqlSession.selectOne(namespace + ".getMax");
	}

	@Override
	public void insertPlan(ProjectDTO projectDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFunding(ProjectDTO projectDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertProject(ProjectDTO projectDto) {
		sqlSession.insert(namespace + ".insertProject", projectDto);
	}
	
	@Override
	public List<String> getCategoryList() {
		return sqlSession.selectList(namespace + ".getCategoryList");
	}


	
	
	
	
	
	
}
