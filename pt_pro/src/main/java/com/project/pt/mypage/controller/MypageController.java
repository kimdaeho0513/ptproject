package com.project.pt.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.pt.login.controller.SignupController;
import com.project.pt.login.vo.SignupVO;
import com.project.pt.management.model.ManagementDTO;
import com.project.pt.mem.model.MemDTO;
import com.project.pt.mypage.model.MypageDTO;
import com.project.pt.mypage.service.MypageService;


@Controller

public class MypageController {
	@Autowired
	private MypageService service;
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@RequestMapping(value="/mypage")
	
	  public String mypage(Model model , HttpSession session
	  )
		{
	 
		MemDTO code = (MemDTO) session.getAttribute("loginData");
		System.out.println(code.getUserscode()); 
		MypageDTO data = service.getData(code.getUserscode()); //모든데이터 조회
		model.addAttribute("data", data); //모든데이터를 ALL에 저장 -> JSTL 사용
		System.out.println(data);
		MypageDTO ptdata =  service.getPtdata(code.getUserscode());
		model.addAttribute("ptdata",ptdata);
		System.out.println(ptdata);
		  
		  if(data != null) {
			  return "mypage/mypage"; 
			  } else {
				  return "mypage/mypage";
			  }
		 
	}
	
	@PostMapping(value="/update")
	public String update(MypageDTO MD, HttpSession session) {
		logger.info("Update({},{},{},{},{},{})",MD.getPassword(),MD.getName(),
				MD.getBirth(),MD.getPhone(),MD.getEmail(),MD.getGender());
		System.out.println(MD);
		boolean result = service.update(session,MD);
		
		if(result) {
			System.out.println("성공");
			return "redirect:/mypage";
		}else {
			System.out.println("실패");
		}
		return "mypage/mypage";
	}
	@PostMapping(value="/delete")
	public String delete(MypageDTO MD, HttpSession session) {
		System.out.println(MD);
		boolean result = service.delete(session,MD);
		
		if(result) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return "/index";
	}
}
