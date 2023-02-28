package com.itwillbs.dao;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;

public interface PaymentDAO {
	
	public UserDTO getUser(String id);
	public ProjectDTO getProject(String idx);
	public PaymentDTO paySuccess (PaymentDTO paymentDto);
	public void insertPayment(PaymentDTO paymentDto);
}
