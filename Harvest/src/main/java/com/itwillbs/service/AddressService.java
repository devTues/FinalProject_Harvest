package com.itwillbs.service;

import com.itwillbs.domain.AddressDTO;

public interface AddressService {
	
	public void insertAddress(AddressDTO addressDTO);
	public AddressDTO getAddress(String id); 

}
