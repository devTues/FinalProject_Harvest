package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PaymentDTO;

public interface AdminDAO {
	
	public List<UserDTO> getUserList(PageDTO dto);
	public UserDTO userView(String userId);
	public List<ProjectDTO> getProject(String ID);
	public List<PaymentDTO> getPayment(String userId);
	public void updateUserBlack(String userId);
	public void updateUserNomal(String userId);
	public String goBlack(String userId);
	public List<ProjectDTO> projectJudge(PageDTO dto);
	public List<ProjectDTO> judgeFinish(PageDTO dto2);
	public String getProStatus(String proIDX);
	public void approvalPro(String proIDX);
	public void refusePro(String proIDX);
	
	public List<ProjectDTO> projectING(PageDTO dto);
	public List<ProjectDTO> projectFinish(PageDTO dto2);
	
	public List<PaymentDTO> payStandby();
	public List<PaymentDTO> paySuccess();
	public List<PaymentDTO> payFinish();
	
	public List<NoticeDTO> getNoticeList(PageDTO dto);
	
	public int maxIDX(); 
	public void insertBoard(NoticeDTO noticeDTO);
	public NoticeDTO getBoard(int IDX);
	
	public int getBoardCount();
	
	public int getJudgeCount();
	public int getFinishCount();
	public int getProIngCount();
	public int getProFinishCount();
	public int getNoticeCount();
	
	public List<UserDTO> getEventUserList(UserDTO userDto);
	
	
}
