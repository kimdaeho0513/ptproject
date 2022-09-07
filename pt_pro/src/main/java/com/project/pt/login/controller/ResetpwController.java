package com.project.pt.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.login.service.LoginService;
import com.project.pt.login.vo.LoginVO;


@Controller
public class ResetpwController {
	private static final Logger logger = LoggerFactory.getLogger(ResetpwController.class);
	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/resetpw",method=RequestMethod.GET)
	public String resetpw(HttpSession session) {
		logger.info("resetpw");
		
		return "login/resetpw";
	}
	
	@RequestMapping(value="/resetpw",method=RequestMethod.POST)
	public String resetpw(LoginVO lv, HttpSession session) {
		logger.info("resetpw({},{})",lv.getId(),lv.getPw());
		
		boolean result = service.modifyPw(lv);
		
		if(result) {
			return "/login/suc_resetpw";
		}else {
			return "redirect:/";
		}
	}
}
