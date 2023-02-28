package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ProductUpdateDTO;

public interface ProductUpdateService {


	public List<ProductUpdateDTO> getUpdateList(ProductUpdateDTO productUpdateDTO);

	void insertBoard(ProductUpdateDTO dto);

	public void deleteBoard(int num);

}
