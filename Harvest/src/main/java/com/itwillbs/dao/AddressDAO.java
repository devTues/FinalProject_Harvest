package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.AddressDTO;

public interface AddressDAO {
	
	public List<AddressDTO> getAddressList(String id);
	
	public void insertAddress(AddressDTO addressDto);
	
	public Integer getMaxIdx();
	
	public void deleteAddress(AddressDTO addressDto);

	public Integer getAddressCount(String id);
	
	public List<AddressDTO> getAddress(String id);
}
