package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.noticeDTO;
import com.itwillbs.domain.payDTO;
import com.itwillbs.dao.adminDAO;

@Service
public class adminServiceImpl implements adminService {
	
	@Inject
	private adminDAO adminDAO;
	
	@Override
	public List<UserDTO> getUserList(PageDTO dto) {
		
		// startRow 
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 
		int endRow=startRow+dto.getPageSize()-1;
		
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		
		return adminDAO.getUserList(dto);
	}

	@Override
	public UserDTO userView(String userId) {
		return adminDAO.userView(userId);
	}

	public void updateUserBlack(String userId) {
		adminDAO.updateUserBlack(userId);
	}
	
	@Override
	public void updateUserNomal(String userId) {
		adminDAO.updateUserNomal(userId);
	}
	
	@Override
	public String goBlack(String userId) {
		return adminDAO.goBlack(userId);
	}

	@Override
	public List<ProjectDTO> getProject(String ID) {
		return adminDAO.getProject(ID);
	}

	@Override
	public List<payDTO> getPayment(String userId) {
		return adminDAO.getPayment(userId);
	}

	@Override
	public List<ProjectDTO> projectJudge(PageDTO dto) {
		
		// startRow 
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 
		int endRow=startRow+dto.getPageSize()-1;
		
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		
		return adminDAO.projectJudge(dto);
	}

	@Override
	public List<ProjectDTO> judgeFinish(PageDTO dto2) {
		return adminDAO.judgeFinish(dto2);
	}

	@Override
	public String getProStatus(String proIDX) {
		
		return adminDAO.getProStatus(proIDX);
	}

	@Override
	public void approvalPro(String proIDX) {
		adminDAO.approvalPro(proIDX);
	}

	@Override
	public void refusePro(String proIDX) {
		adminDAO.refusePro(proIDX);
	}

	//프로젝트 현황 페이지
	//펀딩진행중인 목록 불러오기
	@Override
	public List<ProjectDTO> projectING(PageDTO dto) {
		return adminDAO.projectING(dto);
	}
	//펀딩완료한 목록 불러오기(펀딩실패, 펀딩성공)
	public List<ProjectDTO> projectFinish(PageDTO dto2) {
		return adminDAO.projectFinish(dto2);
	}

	
	//결제현황 페이지
	
	@Override
	public List<payDTO> payStandby() {
		return adminDAO.payStandby();
	}

	@Override
	public List<payDTO> paySuccess() {
		return adminDAO.paySuccess();
	}

	@Override
	public List<payDTO> payFinish() {
		return adminDAO.payFinish();
	}
	
	// 공지사항 목록
	@Override
	public List<noticeDTO> getNoticeList(PageDTO dto) {
		return adminDAO.getNoticeList(dto);
	}

	@Override
	public int maxIDX() {
		return adminDAO.maxIDX();
	}

	@Override
	public void insertBoard(noticeDTO noticeDTO) {
		adminDAO.insertBoard(noticeDTO);
	}

	//공지사항 글 상세보기
	@Override
	public noticeDTO getBoard(int IDX) {
		return adminDAO.getBoard(IDX);
	}

	@Override
	public int getBoardCount() {
		return adminDAO.getBoardCount();
	}

	@Override
	public int getJudgeCount() {
		return adminDAO.getJudgeCount();
	}

	@Override
	public int getFinishCount() {
		return adminDAO.getFinishCount();
	}
	//진행중인 펀딩 개수 구해오기
	@Override
	public int getProIngCount() {
		return adminDAO.getProIngCount();
	}
	//완료한 펀딩 개수 구해오기
	@Override
	public int getProFinishCount() {
		return adminDAO.getProFinishCount();
	}
	//공지사항 글 개수 가져오기
	@Override
	public int getNoticeCount() {
		return adminDAO.getNoticeCount();
	}

	
	

	

}
