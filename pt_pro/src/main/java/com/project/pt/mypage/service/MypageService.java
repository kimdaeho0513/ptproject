package com.project.pt.mypage.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.pt.mypage.model.MypageDAO;
import com.project.pt.mypage.model.MypageDTO;
import com.project.pt.pay.model.PayDAO;
import com.project.pt.pay.model.PayDTO;

@Service
public class MypageService {
	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);
	@Autowired
	private MypageDAO dao;
	private PayDAO pdao;

	public List<MypageDTO> getAll() {
		List<MypageDTO> datas = dao.selectAll();
		return datas;
	}

	public MypageDTO getData() {
		MypageDTO data = dao.selectData();
		return data;
	}

	public boolean update(HttpSession session, MypageDTO MD) {
		logger.info("update({},{})", session, MD);
		
		boolean result = dao.updateData(MD);
		if (result) {
			System.out.println("회원정보 수정완료");
			/* session.setAttribute("loginData", MD); */
			return true;
		} else {
			System.out.println("회원정보 수정실패");
			return false;
		}
	}
	public boolean delete(HttpSession session, MypageDTO MD) {
		
		
		boolean result = dao.deleteData(MD);
		logger.info("delete({},{})", session, MD);
		if (result) {
			System.out.println("회원탈퇴 완료");
			session.removeAttribute("loginData");
			return true;
		} else {
			System.out.println("회원탈퇴 실패");
			return false;
		}
	}

}
