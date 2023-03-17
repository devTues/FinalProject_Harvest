package com.itwillbs.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.CommunityDTO;
import com.itwillbs.domain.CommunityReplyDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.CommunityReplyService;
import com.itwillbs.service.CommunityService;
import com.itwillbs.service.PaymentService;
import com.itwillbs.service.ProductUpdateService;
import com.itwillbs.service.ProjectInfoService;
import com.itwillbs.service.UserService;
import com.itwillbs.service.UserServiceImpl.MailSendService;
import com.itwillbs.utill.UploadFile;

@Controller
public class AjaxController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailSendService mailService;	// 나경
	
	@Inject
	private PaymentService paymentService;
	@Inject
	private AddressService addressService;
	@Inject
	private ProjectInfoService projectInfoService;
	@Inject
	private UserService userService;
	@Inject
	private ProductUpdateService productUpdateService;
	@Inject
	private CommunityService communityService;
	@Inject
	private CommunityReplyService communityReplyService;
	
	// 숙인
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// projectList 페이지
	@ResponseBody
	@RequestMapping(value = "/project/likePro" , method = RequestMethod. POST)
	public String like(@RequestParam(value = "PJ_IDX") String pjIdx,
							   @RequestParam(value = "USER_ID") String userId) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		String result = projectInfoService.setLike(param);
		return result;
	}
	
	@RequestMapping(value = "/project/alramPro" , method = RequestMethod. POST)
	@ResponseBody
	public String alram(@RequestParam(value = "PJ_IDX") String pjIdx,
						@RequestParam(value = "USER_ID") String userId) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		String result = projectInfoService.setAlram(param);
		
		return result;
	}
	
	
	// User 페이지	(나경)
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result = "";
		
		String id = request.getParameter("id");
		
		UserDTO dto = userService.getUser(id);
		if(dto != null) {
			result = "아이디 중복";
		}else {
			result = "아이디 사용가능";
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;	
	}
	

//	[이메일 인증]
	@GetMapping("/user/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
			
	}
	
//	[비밀번호 찾기 이메일 인증]
	@GetMapping("/user/findPassCheck")
	@ResponseBody
	public String findPassCheck(String email) {
		return mailService.findEmail(email);
			
	}
	
	// 민영
	@RequestMapping(value="/payment/paySuccessPro", method = RequestMethod.GET)
	public  ResponseEntity<String> paySuccess(Model model, HttpServletRequest request, PaymentDTO paymentDto) throws Exception { 
		String result = "성공";

		paymentService.insertPayment(paymentDto);
	
		 ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
         return entity;
	}
	
		
	@RequestMapping(value="/payment/addressPro", method = RequestMethod.GET)
	public ResponseEntity<String> addressPro(AddressDTO addressDTO, HttpServletRequest request) { //주소 db 저장하는 메서드..
		 addressService.insertAddress(addressDTO);
		 String result = "성공";
		 
		 ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
         return entity;
	}
		

		// 숙인
	// 커뮤니티탭에 댓글쓰기
	@RequestMapping(value = "/project/CommunityWriteAjax", method = RequestMethod.POST)
	public ResponseEntity<List<CommunityDTO>> CommunityWriteAjax(CommunityDTO communityDTO, HttpServletRequest request, MultipartFile file) throws Exception {
		
		String fileName = UploadFile.fileUpload(file, uploadPath);
		
		communityDTO.setPjIdx(Integer.parseInt(request.getParameter("pjIdx")));
		communityDTO.setId(request.getParameter("id"));
		communityDTO.setContent(request.getParameter("content"));
		communityDTO.setContentLabel(request.getParameter("contentLabel"));
		communityDTO.setImgA(fileName);
		
		
		// 커뮤니티 글 넣기
		communityService.insertBoard(communityDTO);
		
		// 넣은 글 ajax로 보내기
		List<CommunityDTO> communityList1 = communityService.getComm1List(communityDTO);
		
		// ResponseEntity에 출력결과를 담아서 리턴
		ResponseEntity<List<CommunityDTO>> entity = new ResponseEntity<List<CommunityDTO>>(communityList1, HttpStatus.OK);
		
		
		return entity; // 이동 주소가 아니라 결과 값을 담아서 리턴

	}
	
	// 커뮤니티탭에 댓글의 댓글쓰기
	@RequestMapping(value = "/project/CommunityReplyAjax", method = RequestMethod.POST)
	public ResponseEntity<List<CommunityReplyDTO>> CommunityReplyAjax(CommunityReplyDTO communityReplyDTO, HttpServletRequest request ) {
		
		communityReplyService.insertReply(communityReplyDTO);
		
		List<CommunityReplyDTO> getCommunityReplyList = communityReplyService.getCommunityReplyList(communityReplyDTO);
		
		// ResponseEntity에 출력결과를 담아서 리턴
		ResponseEntity<List<CommunityReplyDTO>> entity = new ResponseEntity<List<CommunityReplyDTO>>(getCommunityReplyList, HttpStatus.OK);
		
		
		return entity; // 이동 주소가 아니라 결과 값을 담아서 리턴

	}
	
	// 커뮤니티탭에 쓴 댓글 응원/문의/후기 탭마다 다르게 list보이게 하기
	@RequestMapping(value = "/project/CommunityListAjax", method = RequestMethod.GET)	
	public ResponseEntity<List<CommunityDTO>> communityList(HttpServletRequest request, CommunityDTO communityDTO) {
		
		communityDTO.setContentLabel(request.getParameter("contentLabel"));
		communityDTO.setPjIdx(Integer.parseInt(request.getParameter("pjIdx")));

		List<CommunityDTO> commList = communityService.getComm1List(communityDTO);
		
		ResponseEntity<List<CommunityDTO>> entity = new ResponseEntity<List<CommunityDTO>>(commList,HttpStatus.OK);
		
		return entity;
	}
	
	// 커뮤니티탭 댓글 삭제
	@RequestMapping(value = "/project/deleteAjax", method = RequestMethod.GET)	
	public ResponseEntity<String> delete(CommunityDTO communityDTO, HttpServletRequest request, RedirectAttributes redirect) {

		int idx = Integer.parseInt(request.getParameter("idx")); // 프로젝트 번호
		communityService.deleteBoard(idx);
//					redirect.addAttribute("idx", request.getParameter("pjIdx"));

		String result = "삭제 확인";
				
		ResponseEntity<String> entity = new ResponseEntity<String>(result,HttpStatus.OK);

		return entity; 
	}
	
						
}