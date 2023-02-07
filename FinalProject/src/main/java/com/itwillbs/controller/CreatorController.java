package com.itwillbs.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CreatorController {
	
	@RequestMapping(value = "/creator/create", method = RequestMethod.GET)
	public String create(Locale locale, Model model) {
		
		return "creator/projectUpload";
	}
	
	@RequestMapping(value = "/creator/createPro", method = RequestMethod.POST)
	public String createPro() {
		
		return "redirect:/creator/projectUpload";
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
