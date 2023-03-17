package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AddressDAO;
import com.itwillbs.domain.AddressDTO;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Inject
	private AddressDAO addressDAO;

	@Override
	public List<AddressDTO> getAddressList(String id) {
		return addressDAO.getAddressList(id);
	}
	
	@Override
	public void insertAddress(AddressDTO addressDto) {
		if(addressDAO.getMaxIdx() == null) {
			addressDto.setIdx(1);
		} else {
			addressDto.setIdx(addressDAO.getMaxIdx()+1);
		}
		addressDAO.insertAddress(addressDto);
	}

	@Override
	public void deleteAddress(AddressDTO addressDto) {
		addressDAO.deleteAddress(addressDto);
	}

	@Override
	public List<AddressDTO> getAddress(String id) {
		return addressDAO.getAddress(id);
	}

	

}
