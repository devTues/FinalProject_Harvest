package com.itwillbs.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.openbank.domain.AccountRequestDTO;
import com.itwillbs.openbank.domain.AccountResponseDTO;
import com.itwillbs.openbank.domain.RequestTokenDTO;
import com.itwillbs.openbank.domain.ResponseTokenDTO;
import com.itwillbs.openbank.service.OpenBankingService;
import com.itwillbs.service.CreateService;
import com.itwillbs.utill.UploadFile;

@Controller
public class CreateController {
	
	@Inject
	private Map<String, String> projectMap;
	
	@Inject
	private CreateService createService;

	@Inject
	private OpenBankingService openBankingService;

	// 물리적 경로
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/creator/start", method = RequestMethod.GET)
	public String start(Model model, HttpSession session, HttpServletRequest request) {
		String id = (String)session.getAttribute("id");
		
		projectMap.put("id", id);
		
		String pageSize = "5";
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSizeNum = Integer.parseInt(pageSize);
		
		int startRow = (currentPage - 1) * pageSizeNum;
		projectMap.put("pageSize", pageSize);
		projectMap.put("startRow", Integer.toString(startRow));
		
		List<Map<String, String>> projectList = createService.getProjectList(projectMap);
		
		int count = createService.getCount();
	    int pageBlock = 1; 
	    int startPage = (currentPage - 1)/pageBlock * pageBlock + 1;
	    int endPage = startPage+pageBlock - 1;
	    int pageCount = count / pageSizeNum + (count % pageSizeNum == 0 ? 0 : 1);
	    if(endPage > pageCount){
	    	endPage=pageCount;
	    }
	    
	    Map<String, Integer> pageMap = new HashMap<String, Integer>();
	    pageMap.put("pageBlock", pageBlock);
	    pageMap.put("startPage", startPage);
	    pageMap.put("endPage", endPage);
	    pageMap.put("pageCount", pageCount);
	    
	    model.addAttribute("projectList", projectList);
	    model.addAttribute("pageMap", pageMap);

		return "creator/start";
	}

	@RequestMapping(value = "/creator/project", method = RequestMethod.GET)
	public String project(Model model, HttpServletRequest request) throws ParseException {
		String idx = request.getParameter("idx");
		
		if(!idx.equals("0")) {	// idx = 0 : 프로젝트 새로 만들기
			projectMap = createService.getProject(Integer.parseInt(idx));
			model.addAttribute("projectMap", projectMap);
		}
		
		// 카테고리 가져오기
		List<String> categoryNm = createService.getCategoryList();

		model.addAttribute("categoryNm", categoryNm);

		return "creator/allUpload";
	}
	
	@RequestMapping(value = "/creator/createPro", method = RequestMethod.POST)
	public String createPro( HttpServletRequest request
							, RedirectAttributes redirectAttributes
							, ProjectDTO projectDto
							, MultipartHttpServletRequest mtfRequest) throws Exception {
		// 절대경로
		String Path = request.getRealPath("resources/upload");
		
		// 프로필 이미지 (사진 1개)
		if(!mtfRequest.getFile("profile").isEmpty()) {
			String profile = UploadFile.fileUpload(mtfRequest.getFile("profile"), uploadPath, Path);
			projectDto.setCrePro(profile);
		}
		
		// 프로젝트 이미지 (사진 최대 3개) => List<MultipartFile>
		if(!mtfRequest.getFile("images").isEmpty()) {
			String multiImg = "";
			
			for(MultipartFile file : mtfRequest.getFiles("images")) {
				multiImg += UploadFile.fileUpload(file, uploadPath, Path) + "&";
			}
			projectDto.setImg1(multiImg);
		}
		
		createService.insertProject(projectDto);
		
		redirectAttributes.addAttribute("idx", projectDto.getIdx());
		
		return "redirect:/creator/project";
	}
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String getToken(RequestTokenDTO requestTokenDTO, Model model) throws Exception {
		
		ResponseTokenDTO responseTokenDTO = openBankingService.requestToken(requestTokenDTO);
		
		AccountRequestDTO accountRequestDTO = new AccountRequestDTO();
		accountRequestDTO.setAccess_token(responseTokenDTO.getAccess_token());
		accountRequestDTO.setUser_seq_no(responseTokenDTO.getUser_seq_no());
		accountRequestDTO.setInclude_cancel_yn("Y");
		accountRequestDTO.setSort_order("D");
		
		AccountResponseDTO accountResponseDTO = openBankingService.findAccount(accountRequestDTO);
		model.addAttribute("access_token", accountRequestDTO.getAccess_token());
		model.addAttribute("accountResponseDTO", accountResponseDTO);

		return "creator/accountList";
	}

}
