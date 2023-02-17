package com.itwillbs.service;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.UserDAO;
import com.itwillbs.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	// 부모 - 자식 객체 생성
	@Inject
	private UserDAO userDAO;
	
	@Override
	public void insertUser(UserDTO userDto) {
		System.out.println("MemberServiceImpl insertUser()");
		System.out.println(userDto.getName());
		System.out.println(userDto.getId());
		System.out.println(userDto.getPass());
		System.out.println(userDto.getPhone());
		
		// MemberController => MemberService => MemberDAO
		userDAO.insertUser(userDto);
	}
	
	
	@Override
	public UserDTO userCheck(UserDTO userDto) {
		System.out.println("UserServiceImpl userCheck()");
		
		// 객체 생성
		// 메서드 호출
//		MemberDAO memberDAO = new MemberDAOImpl();
		return userDAO.userCheck(userDto);
	}
	
	
//	[회원 정보 가져오기]
	@Override
	public UserDTO getUser(String id) {

		return userDAO.getUser(id);
	}

	
//	[비밀번호 가져오기 위해 정보비교]
	@Override
	public UserDTO passCheck(UserDTO userDto) {
		
		return userDAO.passCheck(userDto);
	}




//	[이메일 인증]
	@Component
	public class MailSendService {
		@Autowired
		private JavaMailSenderImpl mailSender2;
		private int authNumber; 
		// 난수 발생
		
			public void makeRandomNumber() {
				// 난수의 범위 111111 ~ 999999 (6자리 난수)
				Random r = new Random();
				int checkNum = r.nextInt(888888) + 111111;
				System.out.println("인증번호 : " + checkNum);
				authNumber = checkNum;
			}
			
			
					//이메일 보낼 양식! 
			public String joinEmail(String email) {
				makeRandomNumber();
				String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
				String toMail = email;
				String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
				String content = 
						"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
		                "<br><br>" + 
					    "인증 번호는 " + authNumber + "입니다." + 
					    "<br>" + 
					    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
				System.out.println(setFrom + "주소 " + toMail +"제목 "+ title +"내용"+ content);
				mailSend(setFrom, toMail, title, content);
				return Integer.toString(authNumber);
			}
			
			//이메일 전송 메소드
			public void mailSend(String setFrom, String toMail, String title, String content) { 
				// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
				try {
					MimeMessage message = mailSender2.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
					helper.setFrom(setFrom);
					helper.setTo(toMail);
					helper.setSubject(title);
					// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
					helper.setText(content,true);
					
					mailSender2.send(message);
		            System.out.println("성공");
				} catch (MessagingException e) {
					e.printStackTrace();
					System.out.println("실패");
				}
				System.out.println("아이디 " + toMail);
				System.out.println("제목 " + title);
			}
	
	}





	



	
}
