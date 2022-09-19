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

import com.project.pt.pay.service.PayService;
import com.project.pt.pay.vo.PayVO;

@Controller
public class PayController {
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	@Autowired
	private PayService service;
	private PayVO data;

	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String pay(Model model, HttpSession session) {
		
		return "/pay";

	}
	//결제
	@RequestMapping(value="/payupdate", method=RequestMethod.GET)
	public String update(PayVO data, HttpSession session) {
		
		
		logger.info("update({},{})",data.getMem_count(), data.getMem_num());
		
		boolean result = service.modify(session, data);

		if(result) {
			System.out.println("성공" );
		} else {
			System.out.println("실패");
		}
		return "redirect:/";
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
		
		int ptCount = 0;
		System.out.println("전 : " + ptCount);
		System.out.println(pt);
		/*
		ptCount = data.getMem_count() + pt;
		data.setMem_count(ptCount);
		*/
		System.out.println("후 : " + ptCount);
		boolean result = service.modify(session, data);
		
		if(result) {
			System.out.println("성공" );
		} else {
			System.out.println("실패");
		}

	}
	

	


}
