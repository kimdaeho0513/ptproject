package com.project.pt.management.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.db.DBConn;

@Repository
public class ManagementDAO {

	@Autowired
	private SqlSession session;
	
	private String mapper = "totalMapper.%s";

	public List<ManagementDTO> selectAll() {
		String mapperId = String.format(mapper, "totalSelectAll");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}

	public ManagementDTO selectData(int mngNum) {
		String mapperId = String.format(mapper, "selectData");
		ManagementDTO res = session.selectOne(mapperId, mngNum);
		return res;
	}

	public List<ManagementDTO> selectMember() {
		String mapperId = String.format(mapper, "selectMember");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}

	public List<ManagementDTO> selectTrainer() {
		String mapperId = String.format(mapper, "selectTrainer");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}
	
	public List<ManagementDTO> detailAll() {
		String mapperId = String.format(mapper, "detailDatas");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}
	
	
	}
	
	
/*	
	//관리자 기능 admin
	//회원 전체 정보 출력 
	public List<ManagementDTO> selectAll(){
		return null;
}
	//회원 등급 조정
public int updateRole(int mngNum, String mngRole) {
	return 0;
}

	//회원 상세 정보페이지
public ManagementDTO selectUser(int mngNum) {
	return null;
}

//전체조회 
public ArrayList<MemberBean> getMemberList() {
	ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
	connection conn = null;
	preparedStatement pstmt = null;
	resultSet rs = null;
	MemberBean member = null;
}*/
 