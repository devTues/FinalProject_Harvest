package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.domain.CategoryDTO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.PaymentDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.adminMapper";
	
	@Override
	public List<UserDTO> getUserList(PageDTO dto) {
		return sqlSession.selectList(namespace+".getUserList", dto);
	}
	//�쉶�썝�긽�깭蹂�寃�
	@Override
	public void updateUserBlack(String ID) {
		sqlSession.update(namespace+".userUpdateBlack", ID);
	}
	
	@Override
	public void updateUserNomal(String ID) {
		sqlSession.update(namespace+".userUpdateNomal", ID);
	}
	
	@Override
	public String goBlack(String ID) {
		return sqlSession.selectOne(namespace+".goBlack", ID);
	}
	
	@Override
	public UserDTO userView(String ID) {
		return sqlSession.selectOne(namespace+".userView", ID); 
	}
	@Override
	public List<ProjectDTO> getProject(String ID) {
		return sqlSession.selectList(namespace+".getProject", ID);
	}
	@Override
	public List<PaymentDTO> getPayment(String ID) {
		return sqlSession.selectList(namespace+".getPayment", ID);
	}

	@Override
	public List<ProjectDTO> projectJudge(PageDTO dto) {
		return sqlSession.selectList(namespace+".projectJudge", dto);
	}
	
	@Override
	public List<ProjectDTO> judgeFinish(PageDTO dto2) {
		return sqlSession.selectList(namespace+".judgeFinish", dto2);
	}


	@Override
	public String getProStatus(String proIDX) {
		return sqlSession.selectOne(namespace+".getProStatus", proIDX);
	}

	@Override
	public void approvalPro(String proIDX) {
		sqlSession.update(namespace+".approvalPro", proIDX);
	}

	@Override
	public void refusePro(String proIDX) {
		sqlSession.update(namespace+".refusePro" , proIDX);
	}

	@Override
	public List<ProjectDTO> projectING(PageDTO dto) {
		return sqlSession.selectList(namespace+".projectING",dto);
	}

	@Override
	public List<ProjectDTO> projectFinish(PageDTO dto2) {
		return sqlSession.selectList(namespace+".projectFinish", dto2);
	}

	@Override
	public List<PaymentDTO> payStandby() {
		return sqlSession.selectList(namespace+".payStandby");
	}

	@Override
	public List<PaymentDTO> paySuccess() {
		return sqlSession.selectList(namespace+".paySuccess");
	}

	@Override
	public List<PaymentDTO> payFinish() {
		return sqlSession.selectList(namespace+".payFinish");
	}
	
	@Override
	public List<NoticeDTO> getNoticeList(PageDTO dto) {
		return sqlSession.selectList(namespace+".getNoticeList", dto);
	}

	@Override
	public int maxIDX() {
		return sqlSession.selectOne(namespace+".maxIDX");
	}

	@Override
	public void insertBoard(NoticeDTO noticeDTO) {
		sqlSession.insert(namespace+".insertBoard", noticeDTO);
		
	}

	@Override
	public NoticeDTO getBoard(int IDX) {
		return sqlSession.selectOne(namespace+".getBoard" , IDX);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(namespace+".getBoardCount");
	}

	@Override
	public int getJudgeCount() {
		return sqlSession.selectOne(namespace+".getJudgeCount");
	}

	@Override
	public int getFinishCount() {
		return sqlSession.selectOne(namespace+".getFinishCount");
	}

	@Override
	public int getProIngCount() {
		return sqlSession.selectOne(namespace+".getProIngCount");
	}

	@Override
	public int getProFinishCount() {
		return sqlSession.selectOne(namespace+".getProFinishCount");
	}

	@Override
	public int getNoticeCount() {
		return sqlSession.selectOne(namespace+".getNoticeCount");
	}
	

	@Override
	public List<CategoryDTO> categoryList() {
		return sqlSession.selectList(namespace+".categoryList");
	}
	
	@Override
	public void categoryRegisterPRO(CategoryDTO categoryDTO) {
		sqlSession.insert(namespace+".categoryRegisterPRO", categoryDTO );
	}
	
	@Override
	public int categoryMaxIDX() {
		return sqlSession.selectOne(namespace+".categoryMaxIDX");
	}
	@Override
	public void categoryDelete(int IDX) {
		sqlSession.delete(namespace+".categoryDelete", IDX);
	}
	@Override
	public void categoryUpdate(CategoryDTO categoryDTO) {
		sqlSession.update(namespace+".categoryUpdate", categoryDTO);
	}
	@Override
	public CategoryDTO categoryView(int IDX) {
		return sqlSession.selectOne(namespace+".categoryView" , IDX);
	}
	@Override
	public List<NoticeDTO> getNomalNotice(PageDTO dto) {
		return sqlSession.selectList(namespace+".getNomalNotice", dto);
	}
	@Override
	public List<NoticeDTO> getEventNotice(PageDTO dto) {
		return sqlSession.selectList(namespace+".getEventNotice", dto);
	}
	@Override
	public void noticeDelete(int IDX) {
		sqlSession.delete(namespace+".noticeDelete", IDX);
		
	}
	@Override
	public NoticeDTO getNoticeDetail(int IDX) {
		return sqlSession.selectOne(namespace+".getNoticeDetail", IDX);
		
	}
	
	// 메일 보내기
	@Override
	public List<UserDTO> getEventUserList(UserDTO userDto) {
		return sqlSession.selectList(namespace+".getEventUserList", userDto);
	}

	// 프로젝트 상태 변경
	@Override
	public int statusFail() {
		return sqlSession.update(namespace+".statusFail");
	}
	
	@Override
	public int statusSuccess() {
		return sqlSession.update(namespace+".statusSuccess");
	}



}
