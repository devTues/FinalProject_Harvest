package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.noticeDTO;
import com.itwillbs.domain.payDTO;

public interface adminDAO {
	
	//ȸ�� ��ü��� -> ȸ���������� 
	public List<UserDTO> getUserList(PageDTO dto);
	public UserDTO userView(String userId);
	// ȸ���������� ���� ������Ʈ ��� 
	public List<ProjectDTO> getProject(String ID);
	public List<payDTO> getPayment(String userId);
	//ȸ������ ���� (�Ϲ�->�������� / ��������->�Ϲ�)
	public void updateUserBlack(String userId);
	public void updateUserNomal(String userId);
	public String goBlack(String userId);
	//������Ʈ �ɻ������� (�ɻ����� ���/ �ɻ�Ϸ�� ���)
	public List<ProjectDTO> projectJudge(PageDTO dto);
	public List<ProjectDTO> judgeFinish(PageDTO dto2);
	//������Ʈ �ɻ� (����/�ݷ�)
	public String getProStatus(String proIDX);
	public void approvalPro(String proIDX);
	public void refusePro(String proIDX);
	
	//������Ʈ ��Ȳ��� (�ݵ�������/�ݵ�����,�ݵ��Ϸ�)
	public List<ProjectDTO> projectING(PageDTO dto);
	public List<ProjectDTO> projectFinish(PageDTO dto2);
	
	//���� ��Ȳ���
	public List<payDTO> payStandby();
	public List<payDTO> paySuccess();
	public List<payDTO> payFinish();
	
	//�������� ��� 
	public List<noticeDTO> getNoticeList(PageDTO dto);
	
	//�������� maxIDX �ҷ�����
	public int maxIDX(); 
	//�������� �� insert�ϱ�
	public void insertBoard(noticeDTO noticeDTO);
	//�������� �� �󼼺���
	public noticeDTO getBoard(int IDX);
	
	
	//����¡ ó��
	//���� �� ���� ���ؿ���
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
