package com.project.pt.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pt.login.service.LoginService;
import com.project.pt.login.vo.SignupVO;


@Controller
public class SignupController {
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/signup",method=RequestMethod.GET)
	public String Signup(HttpSession session) {
		logger.info("signup()");
		return "login/signup";
	}
	
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String Signup(SignupVO sv, HttpSession session) {
		
		logger.info("Signup({},{},{},{},{},{},{})",sv.getName(),sv.getUserid(),sv.getPw(),
				sv.getEmail(),sv.getPhone(),sv.getBirth(),sv.getGender());
		
		boolean result = service.addMem(session,sv);
		
		if(result) {
			return "/login/suc_signup";
		}else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(SignupVO vo) throws Exception{
		logger.info("idChk({})",vo.getUserid());
		int result = service.idChk(vo);
		logger.info("after_idChk({})",result);
		return result;
	}
}
