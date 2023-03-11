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

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.CreateService;
import com.itwillbs.utill.UploadFile;

@Controller
public class CreateController {
	
	@Inject
	private Map<String, String> projectMap;
	
	@Inject
	private CreateService createService;
	
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
		System.out.println("currentPage: " + currentPage + " pageSizeNum: " + pageSizeNum);
		
		int startRow = (currentPage - 1) * pageSizeNum;
		projectMap.put("pageSize", pageSize);
		projectMap.put("startRow", Integer.toString(startRow));
		
		List<Map<String, String>> projectList = createService.getProjectList(projectMap);
		
		int count = createService.getCount();
		System.out.println(count);
	    int pageBlock = 1; 
	    int startPage = (currentPage - 1)/pageBlock * pageBlock + 1;
	    int endPage = startPage+pageBlock - 1;
	    int pageCount = count / pageSizeNum + (count % pageSizeNum == 0 ? 0 : 1);
	    if(endPage > pageCount){
	    	endPage=pageCount;
	    }
	    System.out.println(startPage + " , " + endPage + " , " + pageCount);
	    
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
			
			// 날짜 더하기, 변환
			String endDate = String.valueOf(projectMap.get("END"));
			SimpleDateFormat sdfYMD = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdfYMD.parse(endDate);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			
			// 정산일 계산
			cal.add(Calendar.DATE, 7);
			String payDate = sdfYMD.format(cal.getTime());
			projectMap.put("payDate", payDate);
			
			// 결제일 계산
			cal.add(Calendar.DATE, 9);
			String adjDate = sdfYMD.format(cal.getTime());
			projectMap.put("adjDate", adjDate);
			
			model.addAttribute("projectMap", projectMap);
		}
		
		// 카테고리 가져오기
		List<String> categoryNm = createService.getCategoryList();

		model.addAttribute("categoryNm", categoryNm);

		return "creator/allUpload";
	}
	
	@RequestMapping(value = "/creator/createPro", method = RequestMethod.POST)
//	@RequestMapping(value = "/creator/projectPro", method = RequestMethod.POST)
	public String createPro(HttpServletRequest request, ProjectDTO projectDto, MultipartHttpServletRequest mtfRequest) throws Exception {
		System.out.println("createPro 실행됨");
		
		// 절대경로
		String Path = request.getRealPath("resources/upload");
		//상대 경로
//			String uploadPath = request.getSession().getServletContext().getRealPath(myPath);
		
//		UUID uuid = UUID.randomUUID();
		
//		MultipartFile prifile = mtfRequest.getFile("profile");
//		String newFileName = uuid.toString() + "_" + prifile.getOriginalFilename();
//		FileCopyUtils.copy(prifile.getBytes(), new File(uploadPath, newFileName));
//		projectDto.setCrePro(newFileName);
		
		// 프로필 이미지 (사진 1개)
		if(!mtfRequest.getFile("profile").isEmpty()) {
			String profile = UploadFile.fileUpload(mtfRequest.getFile("profile"), uploadPath, Path);
			projectDto.setCrePro(profile);
		}
		
		// 프로젝트 이미지 (사진 최대 3개) => List<MultipartFile>
		if(!mtfRequest.getFile("images").isEmpty()) {
			String multiImg = "";
			
			for(MultipartFile file : mtfRequest.getFiles("images")) {
//				FileCopyUtils.copy(file.getBytes(), new File(Path, newFileName));
//				multiImg += uuid.toString() + "_" + prifile.getOriginalFilename() + "&";
				multiImg += UploadFile.fileUpload(file, uploadPath, Path) + "&";
			}
			projectDto.setImg1(multiImg);
		}
		
		createService.insertProject(projectDto);
		
		return "redirect:/projectList/main";
	}








}
