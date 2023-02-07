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
	
	@RequestMapping(value = "/creator/editor", method = RequestMethod.GET)
	public String editor(Locale locale, Model model) {
		
		return "creator/editor";
	}
	
}
