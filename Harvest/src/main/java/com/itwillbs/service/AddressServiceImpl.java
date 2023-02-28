package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AddressDAO;
import com.itwillbs.domain.AddressDTO;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Inject
	private AddressDAO addressDAO;

	@Override
	public void insertAddress(AddressDTO addressDTO) {
		addressDAO.insertAddress(addressDTO);
	}

	@Override
	public AddressDTO getAddress(String id) {
		return null;
	}

	

}
