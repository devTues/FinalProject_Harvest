package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.noticeDTO;
import com.itwillbs.domain.payDTO;

public interface adminService {
	
	public List<UserDTO> getUserList(PageDTO dto);
	public UserDTO userView(String userId);
	public void updateUserBlack(String userId);
	public void updateUserNomal(String userId);
	public String goBlack(String userId);
	public List<ProjectDTO> getProject(String ID);
	public List<payDTO> getPayment(String userId);
	//������Ʈ �ɻ� ���
	public List<ProjectDTO> projectJudge(PageDTO dto);
	public List<ProjectDTO> judgeFinish(PageDTO dto2);

	//������Ʈ �ɻ�(����/�ݷ�)
	public String getProStatus(String proIDX);
	public void approvalPro(String proIDX);
	public void refusePro(String proIDX);
	
	//������Ʈ ��Ȳ ���
	public List<ProjectDTO> projectING(PageDTO dto);
	public List<ProjectDTO> projectFinish(PageDTO dto2);
	
	//������Ȳ ���
	public List<payDTO> payStandby();
	public List<payDTO> paySuccess();
	public List<payDTO> payFinish();
	
	//�������� ��� 
	public List<noticeDTO> getNoticeList(PageDTO dto);
	
	//�������� �۾��� maxIDX �������� 
	public int maxIDX(); 
	
	//�������� �� insert�ϱ� 
	public void insertBoard(noticeDTO noticeDTO);
	
	//�������� �� �󼼺���
	public noticeDTO getBoard(int IDX);
	
	//����¡ ó��
	//�� ȸ���� ���ؿ���
	public int getBoardCount();
	
	//�ɻ����� �� ������Ʈ ���ؿ��� 
	public int getJudgeCount();
	//�ɻ�Ϸ�� �� ������Ʈ ���ؿ���
	public int getFinishCount();
	//�������� �ݵ� ���� ���ؿ���
	public int getProIngCount();
	//�Ϸ��� �ݵ� ���� ���ؿ���
	public int getProFinishCount();
	//�������� ��� ���� ���ؿ���
	public int getNoticeCount();
	
	
	
	
}
