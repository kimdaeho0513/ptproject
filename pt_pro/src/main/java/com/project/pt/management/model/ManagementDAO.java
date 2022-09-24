package com.project.pt.management.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.db.DBConn;
import com.project.pt.common.util.Paging;
import com.project.pt.common.util.Search;

@Repository
public class ManagementDAO {

	@Inject
	@Autowired
	private  SqlSession session;
	
	private String mapper = "totalMapper.%s";

	public List<ManagementDTO> selectAll() {
		String mapperId = String.format(mapper, "usersSelectAll");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}
	
	public ManagementDTO selectData(int mngNum) {
		String mapperId = String.format(mapper, "selectData");
		ManagementDTO res = session.selectOne(mapperId, mngNum);
		return res;
	}
	
	public List<ManagementDTO> selectTrainer() {
		String mapperId = String.format(mapper, "selectTrainer");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}
	
	public ManagementDTO AllData(int mngNum) {
		String mapperId = String.format(mapper, "AllData");
		ManagementDTO res = session.selectOne(mapperId, mngNum);
		return res;
	}

	public List<ManagementDTO> selectMember() {
		String mapperId = String.format(mapper, "selectMember");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}

	
	public List<ManagementDTO> detailAll() {
		String mapperId = String.format(mapper, "detailDatas");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}

	
	//멤버정보 수정
	public void updateMember(ManagementDTO data) {
		String mapperId = String.format(mapper, "updateMember");
		session.update(mapperId, data);
		System.out.println("실험용 mem dao "+ data);
	}
	//pt,pt선생 수정
	public void updatePt(ManagementDTO data) {
		String mapperId = String.format(mapper, "updatePt");
		session.update(mapperId, data);
		System.out.println("실험용 pt dao "+ data);
	}


		//멤버 삭제
		public boolean deleteData(ManagementDTO data) {
			String mapperId = String.format(mapper, "deleteMember");
			int res = session.delete(mapperId, data);
			return res == 1 ? true : false;
		}
		public List<ManagementDTO> searchAll(String search) {
			String mapperId = String.format(mapper, "search");
			List<ManagementDTO> res = session.selectList(mapperId, search);
			return res;
		}
	}	

 