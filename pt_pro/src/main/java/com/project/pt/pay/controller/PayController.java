package com.project.pt.pay.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.pay.service.PayService;
import com.project.pt.pay.vo.PayVO;

@Controller
public class PayController {
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String pay(HttpSession session) {
		
		return "/pay";
		
	}
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String pay(PayVO pv, HttpSession session) {
		boolean result = service.modify(pv);
		
		if(result) {
			return "/pay/카카오페이결제창";
		} else {
			return "redirect:/";
		}
	}
	

}
