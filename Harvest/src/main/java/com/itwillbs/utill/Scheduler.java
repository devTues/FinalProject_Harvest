package com.itwillbs.utill;


import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.dao.ProjectInfoDAO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.ProjectInfoService;

@Component
public class Scheduler {
	
//	@Transactional
//	@Scheduled(cron = "0 0/1 * * * ?")
//	public void test() {
//		System.out.println("����");
//	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private ProjectInfoDAO projectDAO;
	
	@Inject
	private ProjectInfoService projectService;
	
	// 1�и��� ����ǰ� �׽�Ʈ
//	@Scheduled(cron = "0 0/1 * * * ?")
	
	// ���� 12�ø��� ����
	@Transactional
	@Scheduled(cron = "0 0 0 * * *")
	public void sendMail() throws Exception {
		
		ProjectDTO projectDTO = new ProjectDTO();
		List<ProjectDTO> alram2List=projectService.getAlram2List(projectDTO);
		System.out.println(alram2List.toString());
		
		for(ProjectDTO dto : alram2List) {
			
			String subject = dto.getTitle();
			String content = "https://tumblbug.com/";
	        String from = "omama69@gmail.com";
	        String to = dto.getId();
	        System.out.println(subject +","+content+","+from+","+to);
	        
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	            
	            mailHelper.setFrom(from);
	            mailHelper.setTo(to);
	            mailHelper.setSubject("["+subject+"] send");
	            mailHelper.setText(content);
	            
	            mailSender.send(mail);
	            System.out.println("success");
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	            System.out.println("fail");
	            break;
	        }
		}
		
       
	}
	
	
	
	// ���� ����2�ÿ� ����
	// ALM2 �ڵ��� �˶� ���ó�¥���� START < CURDATE() ����
	@Transactional
	@Scheduled(cron = "0 0 2 * * *")
//	@Scheduled(cron = "0 0/1 * * * ?")
	public int deleteAlram2() {
		System.out.println("ALRAM DELETE");
		return projectDAO.deleteAlram2();
	}
}
