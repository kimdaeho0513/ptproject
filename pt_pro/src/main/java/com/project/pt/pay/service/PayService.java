package com.project.pt.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.pay.model.PayDAO;
import com.project.pt.pay.vo.PayVO;

@Service
public class PayService {

	@Autowired
	private PayDAO dao;
	
	public boolean modify(PayVO data) {
		boolean result = dao.updateData(data);
		return result;
	}
}
