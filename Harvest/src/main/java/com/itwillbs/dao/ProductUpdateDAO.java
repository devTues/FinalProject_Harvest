package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.ProductUpdateDTO;

public interface ProductUpdateDAO {

	public void insertBoard(ProductUpdateDTO dto);
	
	public Integer getMaxNum();
	
	public List<ProductUpdateDTO> getUpdateList(ProductUpdateDTO productUpdateDTO);

	public void deleteBoard(int num);

}
