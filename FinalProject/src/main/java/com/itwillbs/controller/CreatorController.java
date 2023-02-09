package com.itwillbs.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.service.ProjectService;


@Controller
public class CreatorController {
	@Inject
	private ProjectService projectService;
	
	@RequestMapping(value = "/creator/project", method = RequestMethod.GET)
	public String project() {
		
		return "creator/projectUpload";
	}
	
	@RequestMapping(value = "/creator/funding", method = RequestMethod.GET)
	public String funding() {
		
		return "creator/fundingUpload";
	}
	
	@RequestMapping(value = "/creator/createPro", method = RequestMethod.POST)
	public String createPro(ProjectDTO projectDto) {
		System.out.println(projectDto.getImg());
		System.out.println(projectDto.getCrePro());
		System.out.println("intro:" + projectDto.getIntro());
		projectService.insertProject(projectDto);
		return "redirect:/creator/project";
	}

	@RequestMapping(value = "/creator/intro", method = RequestMethod.GET)
	public String intro(Locale locale, Model model) {
		
		return "creator/pjIntro";
	}
	
	@RequestMapping(value = "/creator/budget", method = RequestMethod.GET)
	public String budget(Locale locale, Model model) {
		
		return "creator/pjBudget";
	}
	
	@RequestMapping(value = "/creator/schedule", method = RequestMethod.GET)
	public String schedule(Locale locale, Model model) {
		
		return "creator/pjSchedule";
	}
	
}
