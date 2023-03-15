package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductUpdateDTO;
import com.itwillbs.domain.ProjectDTO;

@Repository
public class ProductUpdateDAOImpl implements ProductUpdateDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.productUpdateMapper";

	@Override
	public void insertBoard(ProductUpdateDTO productUpdateDTO) {
		sqlSession.insert(namespace + ".insertBoard", productUpdateDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<ProductUpdateDTO> getUpdateList(ProductUpdateDTO productUpdateDTO) {
		return sqlSession.selectList(namespace + ".getUpdateList", productUpdateDTO);
	}

	@Override
	public void deleteBoard(ProductUpdateDTO productUpdateDTO) {
		sqlSession.delete(namespace + ".deleteUpdate", productUpdateDTO);
		
	}

	@Override
	public void updateBoard(ProductUpdateDTO productUpdateDTO) {
		sqlSession.update(namespace + ".updateBoard", productUpdateDTO);
	}

	@Override
	public ProjectDTO getCreatorWrite(int idx) {
		return sqlSession.selectOne(namespace + ".creatorWrite", idx);
	}

	
	
	
	
	
	

	
}
