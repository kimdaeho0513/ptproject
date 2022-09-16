package com.project.pt.pay.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.pay.model.PayDAO;
import com.project.pt.pay.vo.PayVO;

@Service
public class PayService {
	private static final Logger logger = LoggerFactory.getLogger(PayService.class);
	

	@Autowired
	private PayDAO dao;
	
	public boolean modify(HttpSession session, PayVO data) {
		logger.info("update({}, {})",session, data);
		
		boolean result = dao.updateData(data);
		if(result) {
			System.out.println("pt 결제 완료");
			session.setAttribute("loginData", data);
			return true;
		} else {
			System.out.println("pt 결제 실패");
			return false;
		}
	}
	

	
}
