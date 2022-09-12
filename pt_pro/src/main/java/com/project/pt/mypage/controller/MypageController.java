package com.project.pt.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.pt.login.controller.SignupController;
import com.project.pt.login.vo.SignupVO;
import com.project.pt.mypage.model.MypageDTO;
import com.project.pt.mypage.service.MypageService;


@Controller

public class MypageController {
	@Autowired
	private MypageService service;
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@RequestMapping(value="/mypage")
	public String mypage(Model model, HttpSession session) {
		
		
			
		MypageDTO data = service.getData();
		model.addAttribute("data", data);
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(MypageDTO MD, HttpSession session) {
		logger.info("Update({},{},{},{},{},{})",MD.getPassword(),MD.getName(),
				MD.getBirth(),MD.getPhone(),MD.getEmail(),MD.getGender());
		
		boolean result = service.update(session,MD);
		
		if(result) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return "redirect:/mypage";
	}
	  
	/*
	 * @RequestMapping(value="/delete") public String mypagedelete(Model model,
	 * HttpSession session) {
	 * 
	 * 
	 * 
	 * MypageDTO data = service.delete(????); model.addAttribute("data", data);
	 * 
	 * return "mypage/mypage"; }
	 */
	 
}
