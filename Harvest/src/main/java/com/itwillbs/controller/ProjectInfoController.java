package com.itwillbs.controller;

import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.CommunityDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProductUpdateDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.CommunityService;
import com.itwillbs.service.ProductUpdateService;
import com.itwillbs.service.ProjectInfoService;


@Controller
public class ProjectInfoController {
	
	@Inject
	private ProjectInfoService projectService;
	
//	@Inject
//	private CommunityService communityService;
	
	@Inject
	private ProductUpdateService productUpdateService;
	
	// xml 업로드 경로(자원이름) => 변수 저장
//	@Resource(name = "uploadPath") // servlet-context.xml에 있는 id
//	private String uploadPath;
		
	@RequestMapping(value = "/main/mainList", method = RequestMethod.GET)
	public String mainList(HttpServletRequest request, Model model) {
		List<ProjectDTO> projectList = projectService.getProjectList();
		model.addAttribute("projectList", projectList);
		return "main/list";
	}
	
	@RequestMapping(value = "/project/projectInfo", method = RequestMethod.GET)
	public String projectInfo(@RequestParam("idx")int idx, Model model, HttpSession session, CommunityDTO communityDTO, ProductUpdateDTO productUpdateDTO) {
		
		Map<String, String> param = new HashMap<String, String>();
		String sessionId = (String)session.getAttribute("iD");
		if(sessionId != null) {
			param.put("SESSIONID", sessionId);
		}
		param.put("IDX", idx + "");
		
		ProjectDTO projectDTO = projectService.getProjectInfo(param);
		
		List<ProductUpdateDTO> productUpdateList = productUpdateService.getUpdateList(productUpdateDTO);
		
		model.addAttribute("projectDTO", projectDTO);
		
		// 숙
		model.addAttribute("productUpdateList", productUpdateList);
		
		model.addAttribute("productUpdateDTO", productUpdateDTO);
		model.addAttribute("communityDTO", communityDTO);
		return "projectInfo/projectInfoPage";
	}

	// 숙인
//	@RequestMapping(value = "/project/productStory", method = RequestMethod.GET)
//	public String productStory(HttpServletRequest request, Model model, CommunityDTO communityDTO, ProductUpdateDTO productUpdateDTO) {
//		
//		List<ProductUpdateDTO> productUpdateList = productUpdateService.getUpdateList(productUpdateDTO);
//		model.addAttribute("productUpdateList", productUpdateList);
//		
//		model.addAttribute("productUpdateDTO", productUpdateDTO);
//		model.addAttribute("communityDTO", communityDTO);
//		
//		// 기본 이동방식 : 주소변경 없이 이동
//		return "project/productStory"; 	// 실제 이동 주소
//	}
	
	@RequestMapping(value = "/project/productUpdateWritePro", method = RequestMethod.POST)
	public String productUpdateWritePro(RedirectAttributes redirect, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		
		// 업로드 파일명 : 랜덤문자_파일이름 (파일 이름이 중복이 안되도록 하기위함)
		UUID uuid = UUID.randomUUID();// UUID : 자바에서 랜덤으로 뽑아오기 위함
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		
		// 원본파일을 복사해서 upload폴더에 붙여넣기
//		FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만든 거);
//		FileCopyUtils.copy(file.getBytes(), new File(경로, 파일이름)); //.getBytes() : 원본파일,
//		FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
		
		// BoardDTO 객체 생성 <= 저장
		ProductUpdateDTO productUpdateDTO = new ProductUpdateDTO();
		productUpdateDTO.setId(request.getParameter("id"));
		productUpdateDTO.setContent(request.getParameter("content"));
//		productUpdateDTO.setIdx(Integer.parseInt(request.getParameter("idx")));
		productUpdateDTO.setPjIdx(Integer.parseInt(request.getParameter("pjIdx")));
		productUpdateDTO.setFile(filename);
		
		productUpdateService.insertBoard(productUpdateDTO);
		redirect.addAttribute("pjIdx", request.getParameter("pjIdx"));
		
		// 기본 이동방식 : 주소변경 없이 이동
		return "redirect:/projectInfo/projectInfoPage";
	}
	
	@RequestMapping(value = "/project/delete", method = RequestMethod.GET)	
	public String delete(HttpServletRequest request, RedirectAttributes redirect) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		productUpdateService.deleteBoard(num);
		
		ProductUpdateDTO productUpdateDTO = new ProductUpdateDTO();
		productUpdateDTO.setPjIdx(Integer.parseInt(request.getParameter("pjIdx")));
		System.out.println(Integer.parseInt(request.getParameter("pjIdx")));

		redirect.addAttribute("pjIdx", request.getParameter("pjIdx"));

		
		return "redirect:/projectInfo/projectInfoPage"; 
	}
	
	

}
