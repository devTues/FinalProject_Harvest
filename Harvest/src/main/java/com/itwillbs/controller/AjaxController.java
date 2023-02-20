package com.itwillbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.ProjectInfoService;
import com.itwillbs.service.UserService;
import com.itwillbs.service.UserServiceImpl.MailSendService;

@Controller
public class AjaxController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailSendService mailService;
	
	@Inject
	private ProjectInfoService projectInfoService;
	@Inject
	private UserService userService;
	
	
	// projectList 페이지
	@ResponseBody
	@RequestMapping(value = "/project/likePro" , method = RequestMethod. POST)
	public String like(@RequestParam(value = "PJ_IDX") String pjIdx,
							   @RequestParam(value = "USER_ID") String userId) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		String result = projectInfoService.setLike(param);
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
		String result = projectInfoService.setAlram(param);
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
	
	
	// User 페이지
	// '${pageContext.request.contextPath }/user/idCheck' 가상주소
		// 주소 매핑 처리 => 처리결과 출력
		@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
		public ResponseEntity<String> idCheck(HttpServletRequest request) {
			String result = "";
			
			// data:{'id':$('.id').val()},
			String id = request.getParameter("id");
			
			// UserDTO dto = getUser() 메서드 호출
			UserDTO dto = userService.getUser(id);
			if(dto != null) {
				// 아이디 있음 => 아이디 중복
				result = "아이디 중복";
			}else {
				// 아이디 없음 => 아이디 사용가능
				result = "아이디 사용가능";
			}
			
			// ResponseEntity에 출력 결과를 담아서 리턴
			ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
			return entity;	//결과 리턴
			
		}
		
		

//		[이메일 인증]
		@GetMapping("/user/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
			
				
		}
						
}