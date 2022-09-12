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

@Service
public class MypageService {
	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);
	@Autowired
	private MypageDAO dao;
	public List<MypageDTO> getAll() {
		List<MypageDTO> datas = dao.selectAll();
		return datas;
	}
	public MypageDTO getData() {
		MypageDTO data = dao.selectData();
		return data;
	}
	public boolean update(HttpSession session, MypageDTO MD) {
		logger.info("update({},{})",session,MD);
		
		
		
		MypageDTO data = new MypageDTO();
		data.setPassword(MD.getPassword());
		data.setName(MD.getName());
		data.setEmail(MD.getEmail());
		data.setPhone(MD.getPhone());
		data.setBirth(MD.getBirth());
		data.setGender(MD.getGender());
		
		boolean result=dao.updateData(data);
		if(result) {
			System.out.println("회원정보 수정완료");
			return true;
		}else {
			System.out.println("회원정보 수정실패");
			return false;
		}
	}
}
