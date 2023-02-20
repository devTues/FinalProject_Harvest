package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.CreateService;

@Controller
public class CreateController {
	
	@Inject
	private CreateService createService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/creator/project", method = RequestMethod.GET)
	public String project(Model model) {
		List<String> categoryNm = createService.getCategoryList();
		
		model.addAttribute("categoryNm", categoryNm);
		
		return "creator/projectUpload";
	}
	
	@RequestMapping(value = "/creator/createPro", method = RequestMethod.POST)
	public String createPro(HttpSession session, ProjectDTO projectDto, MultipartHttpServletRequest mtfRequest) throws Exception {
		System.out.println("createPro");
		String id = (String)session.getAttribute("id");
//		String id = "admin";
		projectDto.setId(id);
		System.out.println(projectDto);
		
		MultipartFile mf = mtfRequest.getFile("profile");
		List<MultipartFile> fileList = mtfRequest.getFiles("images");
		
		// 랜덤문자 생성(랜덤문자_파일이름)
		UUID uuid = UUID.randomUUID();
		
		// 단일 파일 (프로필 이미지 저장)
		String crePro = uuid.toString() + "_" + mf.getOriginalFilename();
		mf.transferTo(new File(uploadPath, crePro));
		
		// 다중 파일 (프로젝트 이미지 저장)
		String img = "";
		for(MultipartFile file : fileList) {
			String image = uuid.toString() + "_" + file.getOriginalFilename();
			file.transferTo(new File(uploadPath, image));
			img += uuid.toString() + "_" + file.getOriginalFilename() + "/";
		}
		
//		String[] imgs = saveImg.split("/");
//		 Map<String, String> imgMap = new HashMap<String, String>();
//		 imgMap.put(crePro, saveImg);
		
		projectDto.setCrePro(crePro);	// 프로필 이미지
		
		// 프로젝트 이미지들
//		projectDto.setImg(img);
//		projectDto.setImg1(imgs[0]);
//		projectDto.setImg2(imgs[1]);
//		projectDto.setImg3(imgs[2]);
		
		System.out.println("프로필 사진 " + crePro + "\n프로젝트 사진 " + img);

		createService.insertProject(projectDto);
		return "redirect:/mainpage/main";
	}

	@RequestMapping(value = "/creator/plan", method = RequestMethod.GET)
	public String plan() {
		
		return "creator/planUpload";
	}
	
	@RequestMapping(value = "/creator/funding", method = RequestMethod.GET)
	public String funding() {
		
		return "creator/fundingUpload";
	}
}
