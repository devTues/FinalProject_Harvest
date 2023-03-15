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

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.dao.ProjectInfoDAO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.ProjectInfoService;

@Component
public class Scheduler {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	private ProjectInfoDAO projectDAO;
	
	@Inject
	private ProjectInfoService projectService;
	

	@Inject
	private AdminDAO adminDAO;
	
	@Transactional
	@Scheduled(cron = "0 0 0 * * *")
	public void sendMail() throws Exception {
		
		ProjectDTO projectDTO = new ProjectDTO();
		List<ProjectDTO> alram2List=projectService.getAlram2List(projectDTO);
		
		for(ProjectDTO dto : alram2List) {
			
			String subject = dto.getTitle();
			String content = "https://tumblbug.com/";
	        String from = "omama69@gmail.com";
	        String to = dto.getId();
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
	            
	            mailHelper.setFrom(from);
	            mailHelper.setTo(to);
	            mailHelper.setSubject("["+subject+"] send");
	            mailHelper.setText(content);
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	            break;
	        }
		}
		
       
	}
	
	
	
	@Transactional
	@Scheduled(cron = "0 0 2 * * *")
	public int deleteAlram2() {
		return projectDAO.deleteAlram2();
	}
	
	// 자정마다
	@Transactional
	@Scheduled(cron = "0 0 0 * * *")
	public int statusFail() {
		return adminDAO.statusFail();
	}
	
	@Transactional
	@Scheduled(cron = "0 0 0 * * *")
	public int statusSuccess() {
		return adminDAO.statusSuccess();
	}
	
}
