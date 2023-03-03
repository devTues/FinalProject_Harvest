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
import org.springframework.util.FileCopyUtils;
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
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private CreateService createService;

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
			projectMap = createService.getProject(Integer.parseInt(idx));
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
		String myPath = "resources/upload";
		// 절대 경로
		String Path = request.getRealPath(myPath);
		//상대 경로
//			String uploadPath = request.getSession().getServletContext().getRealPath(myPath);
		System.out.println(Path);
		System.out.println(uploadPath);
		UUID uuid = UUID.randomUUID();
		
		MultipartFile prifile = mtfRequest.getFile("profile");
		
		String newFileName = uuid.toString() + "_" + prifile.getOriginalFilename();
		
		FileCopyUtils.copy(prifile.getBytes(), new File(uploadPath, newFileName));
		projectDto.setCrePro(newFileName);
		
//		if(!mtfRequest.getFile("profile").isEmpty()) {
//			// 프로필 이미지 (사진 1개)
//			
//			projectDto.setCrePro(UploadFile.fileUpload(uploadPath, mtfRequest.getFile("profile")));
//		}
		
		if(!mtfRequest.getFile("images").isEmpty()) {
			String multiImg = "";
			// 프로젝트 이미지 (사진 최대 3개) => List<MultipartFile>
			for(MultipartFile file : mtfRequest.getFiles("images")) {
				
				FileCopyUtils.copy(file.getBytes(), new File(Path, newFileName));
				multiImg += UUID.randomUUID().toString() + "_" + prifile.getOriginalFilename() + "&";
			}
			projectDto.setImg1(multiImg);
		}
		
		createService.insertProject(projectDto);
		return "redirect:/mainpage/main";
	}








}
