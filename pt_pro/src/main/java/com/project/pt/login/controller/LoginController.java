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



<<<<<<< HEAD

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpSession session) {
		logger.info("login()");
		
		return "login/login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(LoginVO loginVo,HttpSession session) {
		logger.info("login({}, {}, {})",loginVo.getUserid(),loginVo.getPw(),loginVo.getRoles());
		
		boolean result = service.getLogin(session,loginVo);
		
		if(result) {
			
			System.out.println("성공"+session.getAttribute("loginData"));
			
=======
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpSession session) {
		logger.info("login()");
		
		return "login/login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(LoginVO loginVo,HttpSession session) {
		logger.info("login({}, {}, {})",loginVo.getId(),loginVo.getPw(),loginVo.getRole());
		
		boolean result = service.getLogin(session,loginVo);
		
		if(result) {
			System.out.println("성공");
>>>>>>> refs/remotes/origin/양효진
		}else {
			System.out.println("실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("logout()");
		session.removeAttribute("loginData");
		return "redirect:/";
	}
}
