package com.project.pt.pay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pt.login.vo.LoginVO;
import com.project.pt.mem.model.MemDTO;
import com.project.pt.mypage.model.MypageDTO;
import com.project.pt.pay.service.PayService;
import com.project.pt.pay.vo.PayVO;

@Controller
public class PayController {
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	@Autowired
	private PayService service;

	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String pay(HttpSession session, PayVO data) {
		session.getAttribute("loginData");
		logger.info("loginData({})",session.getAttribute("loginData"));
		
		return "pay/pay";
	}

	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String pay(HttpSession session) {
		session.getAttribute("loginData");
		logger.info("loginData({})",session.getAttribute("loginData"));
		
		return "pay/pay";

	}

	
	//결제 성공시
	@GetMapping(value="/chargept")
	public @ResponseBody void ptCount(HttpSession session, Long amount) {
		
		System.out.println(amount);
		int pt = 0; 
		if(amount == 50000) {
			pt = 10;
		} else if(amount == 90000) {
			pt = 20;
		} else if(amount == 130000) {
			pt = 30; 
		} else if(amount == 200000) {
			pt = 50;
		}
		
		System.out.println(pt);
		
		MemDTO memdto = (MemDTO)session.getAttribute("loginData");
		
		int ptCount = service.getData(memdto.getUserscode()) + pt;


		System.out.println("후 : " + ptCount);
		boolean result = service.modify(memdto.getUserscode(), ptCount);
		
		if(result) {
			System.out.println("pt 횟수 입력 성공" );
		} else {
			System.out.println("pt 횟수 입력 실패");
		}
	}
	


}