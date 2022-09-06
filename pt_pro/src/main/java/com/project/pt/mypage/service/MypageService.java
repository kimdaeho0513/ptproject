package com.project.pt.mypage.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.pt.mypage.model.MypageDAO;
import com.project.pt.mypage.model.MypageDTO;

@Service
public class MypageService {
	
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
	public boolean modify(MypageDTO data) {
		boolean result = dao.updateData(data);
		return result;
	}
	
	/*
	 * public boolean remove(MypageDTO data) { MypageDTO data = new MypageDTO();
	 * data.setId(data.getId());
	 * 
	 * dao.deleteData(data); boolean result = dao.deleteData(data);
	 * 
	 * return result; }
	 */
}
