package com.project.pt.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.login.service.LoginService;
import com.project.pt.login.vo.FindVO;

@Controller
public class FindpwController {
	private static final Logger logger = LoggerFactory.getLogger(FindpwController.class);

	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/findpw",method=RequestMethod.GET)
	public String login(HttpSession session) {
		logger.info("findpw()");
		return "login/findpw";
	}
	
	@RequestMapping(value="/findpw",method=RequestMethod.POST)
	public String login(FindVO fv, HttpSession session,Model model) {
		logger.info("findpw({},{},{})",fv.getName(),fv.getUserid(),fv.getEmail());
		
		boolean result = service.getPw(session,fv);
		
		System.out.println(session.getAttribute("findPw"));
		
		if(result) {
			return "redirect:/cert";
		}else {
			model.addAttribute("msg","회원이 존재하지 않습니다.");
			return "/login/findpw";
			
		}
	}
}
