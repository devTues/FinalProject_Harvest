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

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.ProjectListService;

@Controller
public class ProjectListController {
	
	@Inject
	private ProjectListService projectListService;
	
	@RequestMapping(value = "projectList/main", method = RequestMethod.GET)	
	public String main(Model model, HttpServletRequest request, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		param.put("SEARCH", "");
		param.put("CATEGORY", "");
		
		param.put("GB", "POP");
		List<ProjectDTO> popList=projectListService.getProjectList(param);
		model.addAttribute("getPopList", popList);
		
		param.put("GB", "NEW");
		List<ProjectDTO> newList=projectListService.getProjectList(param);
		model.addAttribute("getNewList", newList);
		
		param.put("GB", "DEAD");
		List<ProjectDTO> deadList=projectListService.getProjectList(param);
		model.addAttribute("getDeadList", deadList);
		
		param.put("GB", "EXP");
		List<ProjectDTO> expList=projectListService.getProjectList(param);
		model.addAttribute("getExpList", expList);
		
		param.put("GB", "ALL");
		List<ProjectDTO> allList=projectListService.getProjectList(param);
		model.addAttribute("getAllList", allList);
		
		return "projectList/main";
	}
	
	@RequestMapping(value = "projectList/search", method = RequestMethod.GET)	
	public String search(@RequestParam("search")String search, Model model, HttpServletRequest request, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		param.put("SEARCH", search + "");
		param.put("CATEGORY", "");
		param.put("GB", "");
		
		List<ProjectDTO> searchList=projectListService.getProjectList(param);
		model.addAttribute("getAllList", searchList);
		int count = projectListService.getCount(param);
		model.addAttribute("getCount", count);
		
		return "projectList/allProject";
	}
	
	@RequestMapping(value = "projectList/category", method = RequestMethod.GET)	
	public String category(@RequestParam("category")String category, Model model, HttpServletRequest request, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		param.put("CATEGORY", category + "");
		param.put("SEARCH", "");
		param.put("GB", "");
		
		List<ProjectDTO> categoryList=projectListService.getProjectList(param);
		model.addAttribute("getAllList", categoryList);
		
		int count = projectListService.getCount(param);
		model.addAttribute("getCount", count);
		
		return "projectList/allProject";
	}
	
	@RequestMapping(value = "projectList/popular", method = RequestMethod.GET)	
	public String popular(Model model, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("GB", "POP");
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		param.put("SEARCH", "");
		param.put("CATEGORY", "");
		
		List<ProjectDTO> popList=projectListService.getProjectList(param);
		model.addAttribute("getPopList", popList);
		
		int count = projectListService.getCount(param);
		model.addAttribute("getCount", count);
		
		return "projectList/popular";
	}
	
	@RequestMapping(value = "projectList/newly", method = RequestMethod.GET)	
	public String newly(Model model, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("GB", "NEW");
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		param.put("SEARCH", "");
		param.put("CATEGORY", "");
		
		List<ProjectDTO> newList=projectListService.getProjectList(param);
		model.addAttribute("getNewList", newList);
		
		int count = projectListService.getCount(param);
		model.addAttribute("getCount", count);
		
		return "projectList/newly";
	}
	
	@RequestMapping(value = "projectList/deadline", method = RequestMethod.GET)	
	public String deadline(Model model, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("GB", "DEAD");
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		param.put("SEARCH", "");
		param.put("CATEGORY", "");
		
		List<ProjectDTO> deadList=projectListService.getProjectList(param);
		model.addAttribute("getDeadList", deadList);
		
		int count = projectListService.getCount(param);
		model.addAttribute("getCount", count);
		
		return "projectList/deadline";
	}
	
	@RequestMapping(value = "projectList/expect", method = RequestMethod.GET)	
	public String expect(ProjectDTO projectDTO, Model model, HttpSession session) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("GB", "EXP");
		if(session.getAttribute("id") == null) {param.put("SESSIONID", "");}
		else {param.put("SESSIONID", session.getAttribute("id").toString());}
		
		List<ProjectDTO> expectList=projectListService.getExpectList(param);
		model.addAttribute("getExpectList", expectList);
		
		param.put("SEARCH", "");
		param.put("CATEGORY", "");
		int count = projectListService.getCount(param);
		model.addAttribute("getCount", count);
		
		return "projectList/expect";
	}
	
	
}
