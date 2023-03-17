package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.AddressDTO;

public interface AddressService {
	
	public List<AddressDTO> getAddressList(String id);
	
	public void insertAddress(AddressDTO addressDto);
	
	public void deleteAddress(AddressDTO addressDto);

	public List<AddressDTO> getAddress(String id);
	
}
