package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.CreateService;
import com.itwillbs.utill.UploadFile;

@Controller
public class CreateController {
	private Map<String, String> projectMap;
	@Inject
	private CreateService createService;

//	@Resource(name = "uploadPath1")
//	private String uploadPath1;

	@RequestMapping(value = "/creator/start", method = RequestMethod.GET)
	public String start(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Map<String, String>> projectList = createService.getProjectList(id);

		model.addAttribute("projectList", projectList);

		return "creator/start";
	}

	@RequestMapping(value = "/creator/project", method = RequestMethod.GET)
	public String project(Model model, HttpServletRequest request) {
		String idx = request.getParameter("idx");
		if(!idx.equals("0")) {
			System.out.println("0아니니까 실행");
			projectMap = createService.getProject(Integer.parseInt(idx));
			model.addAttribute("projectMap", projectMap);
		}
//		System.out.println(projectMap.toString());
		// 카테고리 가져오기
		List<String> categoryNm = createService.getCategoryList();

		model.addAttribute("categoryNm", categoryNm);

		return "creator/allUpload";
	}
	
	@RequestMapping(value = "/creator/createPro", method = RequestMethod.POST)
//	@RequestMapping(value = "/creator/projectPro", method = RequestMethod.POST)
	public String createPro(HttpServletRequest request, ProjectDTO projectDto, MultipartHttpServletRequest mtfRequest) throws Exception {
//		String root = request.getSession().getServletContext().getRealPath("/");
//		String uploadPath = root + File.separator + "resources" + File.separator + "upload" + File.separator;
		String uploadPath = "C:\\Users\\Dev\\Desktop\\Dev\\gitHub\\Final-Project\\FinalProject\\src\\main\\webapp\\resources\\upload";

		
		if(!mtfRequest.getFile("profile").isEmpty()) {
			// 프로필 이미지 (사진 1개)
			projectDto.setCrePro(UploadFile.fileUpload(uploadPath, mtfRequest.getFile("profile")));
		}
		
		if(!mtfRequest.getFile("images").isEmpty()) {
			String multiImg = "";
			// 프로젝트 이미지 (사진 최대 3개) => List<MultipartFile>
			for(MultipartFile file : mtfRequest.getFiles("images")) {
				multiImg += UploadFile.fileUpload(uploadPath, file) + "&";
			}
			projectDto.setImg1(multiImg);
		}
		
		createService.insertProject(projectDto);
		return "redirect:/mainpage/main";
	}

	@RequestMapping(value = "/creator/plan", method = RequestMethod.GET)
	public String plan(Model model, HttpServletRequest request) {
		String idx = request.getParameter("idx");
		
		if(!idx.equals("0")) {
			projectMap = createService.getProject(Integer.parseInt(idx));
			model.addAttribute("projectMap", projectMap);
		}
		
		return "creator/planUpload";
	}
	
	@RequestMapping(value = "/creator/planPro", method = RequestMethod.POST)
	public String planPro(ProjectDTO projectDto) throws Exception {
		createService.insertPlan(projectDto);
		return "redirect:/mainpage/main";
	}

	@RequestMapping(value = "/creator/funding", method = RequestMethod.GET)
	public String funding(Model model, HttpServletRequest request) {
		String idx = request.getParameter("idx");
		
		if(!idx.equals("0")) {
			projectMap = createService.getProject(Integer.parseInt(idx));
			model.addAttribute("projectMap", projectMap);
		}
		
		return "creator/fundingUpload";
	}

	@RequestMapping(value = "/creator/fundingPro", method = RequestMethod.POST)
	public String fundingPro(ProjectDTO projectDto) throws Exception {
		createService.insertFunding(projectDto);
		return "redirect:/mainpage/main";
	}

}
