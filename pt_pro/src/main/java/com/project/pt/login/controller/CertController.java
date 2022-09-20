package com.project.pt.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.login.service.LoginService;
import com.project.pt.mem.model.MemDTO;

@Controller
public class CertController {
private static final Logger logger = LoggerFactory.getLogger(CertController.class);
	
	@Autowired
	private JavaMailSender javaMailSender;
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/cert",method=RequestMethod.GET)
	public String cert(HttpSession session) {
		logger.info("CertController");
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		MemDTO data = (MemDTO) session.getAttribute("findPw");
		System.out.println(data.getEmail());
		
		System.out.println();
		String auth = service.getAuthCode();
		
		String sender=data.getEmail();
		String context = auth;
		//String sender="tst78899@gmail.com";
		//String context="테스트용";
		
		String[] to = {sender};
		message.setTo(to);
		
		message.setSubject("인증코드입니다_pt");
		message.setText(context);
		
		javaMailSender.send(message);
		
		System.out.println(session.getAttribute("findPw"));
		session.setAttribute("cert", auth);
		System.out.println("인증코드확인 : "+auth);
		return "login/cert";
	}
	@RequestMapping(value="/cert",method=RequestMethod.POST)
	public String cert(Model model,HttpSession session,HttpServletRequest request) {
		logger.info("CertController2");
		String usercert = request.getParameter("usercert");
		System.out.println(session.getAttribute("cert"));
		System.out.println(usercert);
		if(session.getAttribute("cert").equals(usercert)) {
			return "login/resetpw";
		}else {
			return "redirect:/";
		}
		
		
	}
}
