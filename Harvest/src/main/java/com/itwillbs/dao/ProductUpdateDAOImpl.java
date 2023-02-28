package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductUpdateDTO;

@Repository
public class ProductUpdateDAOImpl implements ProductUpdateDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.productUpdateMapper";

	@Override
	public void insertBoard(ProductUpdateDTO dto) {
		sqlSession.insert(namespace + ".insertBoard", dto);
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
	public void deleteBoard(int num) {
		sqlSession.delete(namespace + ".deleteUpdate", num);
		
	}

	
	
	
	
	

	
}
