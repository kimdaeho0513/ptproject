package com.project.pt.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.management.model.ManagementDAO;
import com.project.pt.management.model.ManagementDTO;

@Service
public class ManagementService {

	@Autowired
	private ManagementDAO dao;
	
	public ManagementService() {
		dao = new ManagementDAO();
	}
	
	public List<ManagementDTO> getAll() {
		List<ManagementDTO> datas = dao.selectAll();
		return datas;
	}

	public ManagementDTO getData(int mngNum) {
		ManagementDTO data = dao.selectData(mngNum);
		return data;
	}
	
	public List<ManagementDTO> getMember(){
		List<ManagementDTO> member = dao.selectMember();
		return member;
	}

	public List getTrainer() {
		List<ManagementDTO> trainer = dao.selectTrainer();
		return trainer;
	}
	
	public ManagementDTO detailData(int mngNum){
		ManagementDTO data = dao.selectData(mngNum);
		return data;
	}

	public List<ManagementDTO> detailDatas() {
		List<ManagementDTO> datas = dao.detailAll();
		return datas;
	}
	
}
