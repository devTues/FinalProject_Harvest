package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PaymentDAO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Inject
	private PaymentDAO paymentDAO;

	@Override
	public PaymentDTO paySuccess(PaymentDTO paymentDto) {
		return null;
	}

	@Override
	public UserDTO getUser(String id) {
		return paymentDAO.getUser(id);
	}

	@Override
	public ProjectDTO getProject(String pj_idx) {
		return paymentDAO.getProject(pj_idx);
	}

	@Override
	public void insertPayment(PaymentDTO paymentDto) {
		paymentDAO.insertPayment(paymentDto);
	}

	
	
	
	
	
	
}
