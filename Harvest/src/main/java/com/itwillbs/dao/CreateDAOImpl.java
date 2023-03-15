package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectDTO;


@Repository
public class CreateDAOImpl implements CreateDAO {

	@Inject
	private SqlSession sqlSession;
	private String namespace = "com.itwillbs.mappers.CreateMapper";

	@Override
	public List<Map<String, String>> getProjectList(Map<String, String> projectMap) {
		int startRow = Integer.parseInt(projectMap.get("startRow"));
		int pageSize = Integer.parseInt( projectMap.get("pageSize"));
		RowBounds row = new RowBounds(startRow, pageSize);
		return sqlSession.selectList(namespace + ".getProjectList", projectMap, row);
	}
	
	@Override
	public int getCount() {
		return sqlSession.selectOne(namespace + ".getCount");
	}

	@Override
	public Map<String, String> getProject(int idx) {
		return sqlSession.selectOne(namespace + ".getProject", idx);
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
