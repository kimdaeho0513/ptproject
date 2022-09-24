package com.project.pt.management.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.management.model.ManagementDAO;
import com.project.pt.management.model.ManagementDTO;
import com.project.pt.management.model.MemberDTO;

@Service
public class ManagementService {

	@Autowired
	private ManagementDAO dao;
	
	//전체데이터 조회
	public List<ManagementDTO> getAll() {
		List<ManagementDTO> datas = dao.selectAll();
		return datas;
	}


	public ManagementDTO getData(int mngNum) {
		ManagementDTO data = dao.selectData(mngNum);
		return data;
	}
	
	public ManagementDTO getAllData(int mngNum) {
		ManagementDTO data = dao.AllData(mngNum);
		return data;
	}

	
	public List<ManagementDTO> getMember(){
		List<ManagementDTO> member = dao.selectMember();
		return member;
	}

	
	public List<ManagementDTO> selectTrainer() {
		List<ManagementDTO> datas = dao.selectTrainer();
		return datas;
	}
	

	
	//회원 정보 수정
		public void updateMember(ManagementDTO data) {
			dao.updateMember(data);
			System.out.println("서비스 mem data 확인 " + data);
		}
		
	//회원 정보 수정
		public void updatePt(ManagementDTO data) {
			dao.updatePt(data);
			System.out.println("서비스 Pt data 확인 " + data);
		}
		

	//회원 정보 삭제
	public boolean remove(ManagementDTO data) {
		boolean result = dao.deleteData(data);
		System.out.println("서비스 딜리트확인" + result);
		return result;
	}
	
	//검색용
	public List<ManagementDTO> listSearch(String search) {
		List<ManagementDTO> datas = dao.searchAll(search);
		return datas;
	}
}
