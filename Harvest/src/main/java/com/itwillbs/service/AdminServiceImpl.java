package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.CategoryDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO adminDAO;
	
	@Override
	public List<UserDTO> getUserList(PageDTO dto) {
		
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		int endRow=startRow+dto.getPageSize()-1;
		
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);

		return adminDAO.getUserList(dto);
	}

	public void updateUserBlack(String ID) {
		adminDAO.updateUserBlack(ID);
	}
	
	@Override
	public void updateUserNomal(String ID) {
		adminDAO.updateUserNomal(ID);
	}
	
	@Override
	public String goBlack(String ID) {
		return adminDAO.goBlack(ID);
	}
	
	//�쉶�썝�젙蹂댁긽�꽭蹂닿린
	@Override
	public UserDTO userView(String userId) {
		return adminDAO.userView(userId);
	}

	@Override
	public List<ProjectDTO> getProject(String ID) {
		return adminDAO.getProject(ID);
	}

	@Override
	public List<PaymentDTO> getPayment(String ID) {
		return adminDAO.getPayment(ID);
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
	public List<PaymentDTO> payStandby() {
		return adminDAO.payStandby();
	}

	@Override
	public List<PaymentDTO> paySuccess() {
		return adminDAO.paySuccess();
	}

	@Override
	public List<PaymentDTO> payFinish() {
		return adminDAO.payFinish();
	}
	
	// 공지사항 목록
	@Override
	public List<NoticeDTO> getNoticeList(PageDTO dto) {
		return adminDAO.getNoticeList(dto);
	}

	@Override
	public int maxIDX() {
		return adminDAO.maxIDX();
	}

	@Override
	public void insertBoard(NoticeDTO noticeDTO) {
		adminDAO.insertBoard(noticeDTO);
	}

	//공지사항 글 상세보기
	@Override
	public NoticeDTO getBoard(int IDX) {
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
	
	// 카테고리
	@Override
	public List<CategoryDTO> categoryList() {
		return adminDAO.categoryList();
	}

	@Override
	public void categoryRegisterPRO(CategoryDTO categoryDTO) {
		adminDAO.categoryRegisterPRO(categoryDTO);
	}

	@Override
	public int categoryMaxIDX() {
		return adminDAO.categoryMaxIDX();
	}

	@Override
	public void categoryDelete(int IDX) {
		adminDAO.categoryDelete(IDX);
	}

	@Override
	public CategoryDTO categoryView(int IDX) {
		return adminDAO.categoryView(IDX);
	}

	@Override
	public void categoryUpdate(CategoryDTO categoryDTO) {
		adminDAO.categoryUpdate(categoryDTO);
	}

	@Override
	public List<NoticeDTO> getNomalNotice(PageDTO dto) {
		return adminDAO.getNomalNotice(dto);
	}

	@Override
	public List<NoticeDTO> getEventNotice(PageDTO dto) {
		return adminDAO.getEventNotice(dto);
	}

	@Override
	public void noticeDelete(int IDX) {
		adminDAO.noticeDelete(IDX);
	}

	@Override
	public NoticeDTO getNoticeDetail(int idx) {
		return adminDAO.getNoticeDetail(idx);
	}
	
	// 관리자 메일보내기
	@Override
	public List<UserDTO> getEventUserList(UserDTO userDto) {
		return adminDAO.getEventUserList(userDto);
	}

	
	

	

}
