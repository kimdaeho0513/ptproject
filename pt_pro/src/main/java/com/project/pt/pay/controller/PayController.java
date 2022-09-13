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

	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String pay(HttpSession session) {

		return "/pay";

	}

	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String pay(PayVO pv, HttpSession session) {
		boolean result = service.modify(pv);

		if(result) {
			return "/pay";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value="/kakaopay")
	@ResponseBody
	public String kakaopay() {
		try {
			URL address = new URL("https://kapi.kakao.com//v1/payment/ready");
			HttpURLConnection serverConnection = (HttpURLConnection) address.openConnection();
			serverConnection.setRequestMethod("POST");
			serverConnection.setRequestProperty("Authorization", " KakaoAK 	972abc86e272474955b5831e6ceb361b");
			serverConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			serverConnection.setDoOutput(true); //연결을 통해서 서버에게 전달해줄게 있으면 true
			String param = "cid=TC0ONETIME"
					  + "partner_order_id=partner_order_id"
					  + "partner_user_id=partner_user_id"
					  + "item_name=pt결제&quantity=1"
					  + "total_amount=5000"
					  + "vat_amount=200"
					  + "tax_free_amount=0"
					  + "approval_url=https://localhost8080/pt/pay.jsp"
					  + "fail_url=https://localhost8080/pt/pay.jsp"
					  + "&cancel_url=https://localhost8080/pt/pay.jsp";
			OutputStream outputStream = serverConnection.getOutputStream();
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeBytes(param);
			dataOutputStream.close();
			
			int result = serverConnection.getResponseCode();
			
			InputStream inputStream;
			if(result == 200) {
				inputStream = serverConnection.getInputStream();
			} else {
				inputStream = serverConnection.getErrorStream();
			}
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			return bufferedReader.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/kakaopay";
	}


}
