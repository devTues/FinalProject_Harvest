package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductUpdateDAO;
import com.itwillbs.domain.ProductUpdateDTO;
import com.itwillbs.domain.ProjectDTO;

@Service
public class ProductUpdateServiceImpl implements ProductUpdateService{
	
	@Inject
	private ProductUpdateDAO productUpdateDAO;

	@Override
	public void insertBoard(ProductUpdateDTO productUpdateDTO) {
		
		// 작성 날짜 넣기
		productUpdateDTO.setDate(new Timestamp(System.currentTimeMillis()));
		productUpdateDAO.insertBoard(productUpdateDTO);
	}

	@Override
	public List<ProductUpdateDTO> getUpdateList(ProductUpdateDTO productUpdateDTO) {
		return productUpdateDAO.getUpdateList(productUpdateDTO);
	}

	@Override
	public void deleteBoard(ProductUpdateDTO productUpdateDTO) {
		productUpdateDAO.deleteBoard(productUpdateDTO);
		
	}

	@Override
	public void updateBoard(ProductUpdateDTO productUpdateDTO) {
		productUpdateDAO.updateBoard(productUpdateDTO);
	}

	@Override
	public ProjectDTO getCreatorWrite(int idx) {
		return productUpdateDAO.getCreatorWrite(idx);
	}
	
	
	
	
	

	

}
