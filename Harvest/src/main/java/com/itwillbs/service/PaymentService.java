package com.itwillbs.service;

import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;

public interface PaymentService {
	
	public UserDTO getUser(String id);
	public ProjectDTO getProject(String pj_idx);
	public PaymentDTO paySuccess (PaymentDTO paymentDto);
	public void insertPayment(PaymentDTO paymentDto);
	
}
