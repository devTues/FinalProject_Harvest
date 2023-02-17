package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.ProjectInfoService;


@Controller
public class ProjectInfoController {
	
	@Inject
	private ProjectInfoService projectService;
	
	@RequestMapping(value = "/main/mainList", method = RequestMethod.GET)
	public String mainList(HttpServletRequest request, Model model) {
		List<ProjectDTO> projectList = projectService.getProjectList();
		model.addAttribute("projectList", projectList);
		return "main/list";
	}
	
	@RequestMapping(value = "/project/projectInfo", method = RequestMethod.GET)
	public String projectInfo(@RequestParam("idx")int idx, Model model, HttpSession session) {
		
		Map<String, String> param = new HashMap<String, String>();
		String sessionId = (String)session.getAttribute("iD");
		if(sessionId != null) {
			param.put("SESSIONID", sessionId);
		}
		param.put("IDX", idx + "");
		Integer sumMoney = projectService.getSumMoney(param);
		Integer sumUser = projectService.getSumUser(param);
		ProjectDTO projectDTO = projectService.getProjectInfo(param);
		projectDTO.setSumMoney(sumMoney);
		projectDTO.setSumUser(sumUser);
		model.addAttribute("projectDTO", projectDTO);
		return "projectInfo/projectInfoPage";
	}
	
	@RequestMapping(value = "/payment/payment", method = RequestMethod.GET)
	public String minDona(@RequestParam("idx")int idx, HttpServletRequest request, Model model) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("IDX", idx + "");
		String userDona = request.getParameter("userDona");
//		String idx = request.getParameter("idx");
		String funding_name = request.getParameter("funding_name");
		ProjectDTO projectDTO = projectService.getProjectInfo(param);
		if(funding_name.equals("0")) {
			model.addAttribute("funding_name", userDona);
		} else {
			model.addAttribute("funding_name", funding_name);
		}
		model.addAttribute("idx", idx);
		model.addAttribute("projectDTO", projectDTO);
		return "payment/payment";
	}

}
