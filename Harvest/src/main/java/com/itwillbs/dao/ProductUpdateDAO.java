package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProductUpdateDTO;
import com.itwillbs.domain.ProjectDTO;

public interface ProductUpdateDAO {

	public void insertBoard(ProductUpdateDTO productUpdateDTO);
	
	public Integer getMaxNum();
	
	public List<ProductUpdateDTO> getUpdateList(ProductUpdateDTO productUpdateDTO);

	public void deleteBoard(ProductUpdateDTO productUpdateDTO);
	
	public void updateBoard(ProductUpdateDTO productUpdateDTO);
	
	public ProjectDTO getCreatorWrite(int idx);

}
