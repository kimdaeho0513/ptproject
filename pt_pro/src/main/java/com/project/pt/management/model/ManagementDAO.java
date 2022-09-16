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
	
	public List<ManagementDTO> selectAllDelete() {
		String mapperId = String.format(mapper, "deleteMember");
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

	
	public List<ManagementDTO> detailAll() {
		String mapperId = String.format(mapper, "detailDatas");
		List<ManagementDTO> res = session.selectList(mapperId);
		return res;
	}
	


	public MemberDTO memberDatas(int mngNum) {
		String mapperId = String.format(mapper, "memberDatas");
		MemberDTO res = session.selectOne(mapperId, mngNum);
		return res;
	}

	//트레이너 셀렉
		public List<ManagementDTO> selectTrainers() {
			String mapperId = String.format(mapper, "selectTrainer");
			List<ManagementDTO> res = session.selectList(mapperId);
			return res;
		}
	//멤버 셀렉
		public List<ManagementDTO> selectMembers() {
			String mapperId = String.format(mapper, "selectMember");
			List<ManagementDTO> res = session.selectList(mapperId);
			return res;
		}
		
		//회원정보 수정용 비밀번호 체크
		public boolean check(String mngId, String mngPass) {
			boolean result = false;
			Map<String, String> map = new HashMap<String, String>();
			map.put("mngId", mngId);
			map.put("mngPass", mngPass);
			
			if(map.containsKey(mngId)) {
				if(!map.get(mngId).equals(mngPass)) {
					System.out.println("비밀번호가 틀렸습니다.");
				} else {
					System.out.println("확인되었습니다.");
					result = true;
				}
			}
			return result;
			
//			int count = Session("totalMapper.check", map);
//			if(count == 1) {
//				result = true;
//			}
//			return result;
		}
		
		public boolean updateMember(ManagementDTO dto) {
			String mapperId = String.format(mapper, "updateMember");
			int res = session.update(mapperId, dto);
			return res == 1 ? true : false;
		}

		
		//멤버 삭제 
//		public boolean deleteMemberData(ManagementDTO data) {
//			String mapperId = String.format(mapper, "deleteMember");
//			int res = session.delete(mapperId, data);
//			return res >= 0 ? true : false;
//		}
		//멤버 삭제
		public boolean deleteData(ManagementDTO data) {
			String mapperId = String.format(mapper, "deleteMember");
			int res = session.delete(mapperId, data);
			return res == 1 ? true : false;
		}
	
		
		
//	//트레이너 셀렉
//	public ManagementDTO selectTrainer(String mngRole) {
//		String mapperId = String.format(mapper, "selectTrainer");
//		ManagementDTO res = session.selectOne(mapperId, mngRole);
//		return res;
//	}
//	//멤버 셀렉
//		public ManagementDTO selectMember(String mngRole) {
//			String mapperId = String.format(mapper, "selectMember");
//			ManagementDTO res = session.selectOne(mapperId, mngRole);
//			return res;
//		}
	
	}	

 