package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.MyPageService;

@Controller
public class MyPageController {
	
	
	@Inject
	private MyPageService myPageService;
	
	// 마이페이지
	@RequestMapping(value = "/myPage/myPage", method = RequestMethod.GET)	
	public String myPage() {
		
		return "myPage/myPage";
	}

	
	@RequestMapping(value = "/myPage/mySettingPage", method = RequestMethod.GET)
	public String mySettingPage(HttpSession session, Model model) {	// request대신 Model에 담음
		// 세션값 id에 대한 정보를 DB에서 조회
		String id=(String)session.getAttribute("id");
		
		UserDTO userDto = myPageService.getUser(id);
		
		model.addAttribute("userDto", userDto);
		
		return "myPage/mySettingPage";
	}
	

	@RequestMapping(value = "/myPage/unregist", method = RequestMethod.GET)
	public String unregist(UserDTO userDto) {	
		
		return "myPage/unregist";
	}
	
	// 알람 설정
	@RequestMapping(value = "/myPage/myAlarm", method = RequestMethod.GET)
	public String myAlarmList(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		List<Map<String, String>> myAlarmList = myPageService.getMyAlarmList(id);

		model.addAttribute("myAlarmList", myAlarmList);

		Map<String, String> codeMap =  new HashMap<String, String>();
		codeMap.put("ALM1", "null");
		codeMap.put("ALM2", "null");
		codeMap.put("ALM3", "null");

		
		codeMap.put("idx1", "0");
		codeMap.put("idx2", "0");
		codeMap.put("idx3", "0");
		
		String idx = "";
		
		for(Map<String, String> param : myAlarmList) {
			if(param.get("code").contains("ALM1")) {
				codeMap.put("ALM1", "checked"); 	
				idx = String.valueOf(param.get("idx"));
				codeMap.put("idx1", idx);
				continue;
			}
			if(param.get("code").contains("ALM2")) {
				codeMap.put("ALM2", "checked"); 	
				idx = String.valueOf(param.get("idx"));
				codeMap.put("idx2", idx);
				continue;
			} 
			if(param.get("code").contains("ALM3")) {
				codeMap.put("ALM3", "checked"); 	
				idx = String.valueOf(param.get("idx"));
				codeMap.put("idx3", idx);
				continue;
			} 
			
		}
		
		model.addAttribute("codeMap", codeMap);
		
		return "myPage/myAlarm";

	}

	// 내가 만든 프로젝트
	@RequestMapping(value = "myPage/myCreate", method = RequestMethod.GET)
	public String myCreate(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		List<Map<String, String>> myCreateList = myPageService.getMyCreateList(id);
		int myCreateCount = myPageService.getMyCreateCount(id);
		
		model.addAttribute("myCreateList", myCreateList);
		model.addAttribute("myCreateCount", myCreateCount);
		
		return "myPage/myCreate";
		
	}
	
	// 찜목록
	@RequestMapping(value = "/myPage/myFavorite", method = RequestMethod.GET)
	public String myFavoriteList(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		List<Map<String, String>> myFavoriteList = myPageService.getMyFavoriteList(id);
		
		int myFavoriteCount = myPageService.getMyFavoriteCount(id);
		
		model.addAttribute("myFavoriteList", myFavoriteList);
		model.addAttribute("myFavoriteCount", myFavoriteCount);
		
		return "myPage/myFavorite";
	}
	
	// 후원 목록
	@RequestMapping(value = "/myPage/mySupport", method = RequestMethod.GET)
	public String mySupportList(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		List<Map<String, String>> mySupportList = myPageService.getMySupportList(id);
		int mySupportCount = myPageService.getMySupportCount(id);
		
		model.addAttribute("mySupportList", mySupportList);
		model.addAttribute("mySupportCount", mySupportCount);
		
		return "myPage/mySupport";
	}
}
