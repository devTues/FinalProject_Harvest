package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.service.ProjectService;

@Controller
public class AjaxController {
	
	@Autowired
	private JavaMailSender mailSender;

	@Inject
	private ProjectService projectService;

	@ResponseBody
	@RequestMapping(value = "/project/likePro" , method = RequestMethod. POST)
	public String like(@RequestParam(value = "PJ_IDX") String pjIdx,
							   @RequestParam(value = "USER_ID") String userId) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		String result = projectService.setLike(param);
		System.out.println("아이디" + userId);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/project/alramPro" , method = RequestMethod. POST)
	public String alram(@RequestParam(value = "PJ_IDX") String pjIdx,
						@RequestParam(value = "USER_ID") String userId,
						@RequestParam(value = "TITLE") String title
//						@RequestParam(value = "START") String start
						) throws Exception {
		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		param.put("TITLE", title);
		String result = projectService.setAlram(param);
		String content = "프로젝트펀딩이 시작되었습니다. https://tumblbug.com/";
        String from = "ki6532@naver.com";
		
		try {
        	// �씠硫붿씪 蹂대궡�뒗 援щЦ
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            
            mailHelper.setFrom(from);
            mailHelper.setTo(userId);
            mailHelper.setSubject("["+title+"] 프로젝트 펀딩이 시작되었습니다.");
            mailHelper.setText(content);
            
            mailSender.send(mail);
            
            System.out.println("성공");
            
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("실패");
        }
		
		System.out.println("아이디 " + userId);
		System.out.println("제목 " + title);
		return result;
	}
						
}