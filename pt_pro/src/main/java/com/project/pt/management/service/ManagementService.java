package com.project.pt.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.management.model.ManagementDAO;
import com.project.pt.management.model.ManagementDTO;
import com.project.pt.management.model.MemberDTO;

@Service
public class ManagementService {

	@Autowired
	private ManagementDAO dao;
	
	
	public List<ManagementDTO> getAll() {
		List<ManagementDTO> datas = dao.selectAll();
		return datas;
	}

	public ManagementDTO getData(int mngNum) {
		ManagementDTO data = dao.selectData(mngNum);
		return data;
	}
	
	public List<ManagementDTO> getTrainers() {
		List<ManagementDTO> datas = dao.selectTrainers();
		return datas;
	}
	
	public List<ManagementDTO> getMembers() {
		List<ManagementDTO> datas = dao.selectMembers();
		return datas;
	}
	
//	public ManagementDTO getTrainer(String mngRole) {
//		ManagementDTO data = dao.selectTrainer(mngRole);
//		return data;
//	}
//	
//	public ManagementDTO getMember(String mngRole) {
//		ManagementDTO data = dao.selectMember(mngRole);
//		return data;
//	}
	
	public List<ManagementDTO> getMember(){
		List<ManagementDTO> member = dao.selectMember();
		return member;
	}

	
	public ManagementDTO detailData(int mngNum){
		ManagementDTO data = dao.selectData(mngNum);
		return data;
	}

	public List<ManagementDTO> detailDatas() {
		List<ManagementDTO> datas = dao.detailAll();
		return datas;
	}
	
	public MemberDTO memberDatas(int mngNum) {
		MemberDTO datas = dao.memberDatas(mngNum);
		return datas;
	}
	
	 //아이디 비밀번호 체크	
	public boolean check(String mngId, String mngPass) {
		return dao.check(mngId, mngPass);
	}
	
	//회원 정보 수정
	public boolean updateMember(ManagementDTO dto) {
		boolean result = dao.updateMember(dto);
		return result;
	}

	//회원 정보 삭제
	public boolean remove(ManagementDTO data) {
		ManagementDTO memberData = new ManagementDTO();
		
		//dao.deleteMemberData(memberData);
		boolean result = dao.deleteData(data);
		return result;
	}
}
