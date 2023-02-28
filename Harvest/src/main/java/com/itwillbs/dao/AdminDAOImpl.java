package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.UserDTO;
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

	@Override
	public UserDTO userView(String userId) {
		return sqlSession.selectOne(namespace+".userView", userId); 
	}

	@Override
	public void updateUserBlack(String userId) {
		sqlSession.update(namespace+".userUpdateBlack", userId);
	}
	
	@Override
	public void updateUserNomal(String userId) {
		sqlSession.update(namespace+".userUpdateNomal", userId);
	}
	
	@Override
	public String goBlack(String userId) {
		return sqlSession.selectOne(namespace+".goBlack", userId);
	}

	@Override
	public List<ProjectDTO> getProject(String ID) {
		return sqlSession.selectList(namespace+".getProject", ID);
	}

	@Override
	public List<PaymentDTO> getPayment(String userId) {
		return sqlSession.selectList(namespace+".getPayment", userId);
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
	public List<UserDTO> getEventUserList(UserDTO userDto) {
		return sqlSession.selectList(namespace+".getEventUserList", userDto);
	}
	




}
