package com.project.pt.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.login.service.LoginService;
import com.project.pt.login.vo.FindVO;

@Controller
public class FindidController {
	private static final Logger logger = LoggerFactory.getLogger(FindidController.class);

	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/findid",method=RequestMethod.GET)
	public String findid() {
		logger.info("findid()");
		return "login/findid";
	}
	
	@RequestMapping(value="/findid",method=RequestMethod.POST)
	public String findid(FindVO fv, HttpSession session) {
		logger.info("findid({},{})",fv.getName(),fv.getPhone());
		
		boolean result = service.getId(session, fv);
		
		if(result) {
			return "login/suc_findid";
		}else {
			return "redirect:/";
		}
		
	}
}
