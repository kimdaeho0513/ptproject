package com.project.pt.mypage.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession session;
	
	private String mapper = "mypageMapper.%s";
	
	public List<MypageDTO> selectAll() {
		String mapperId = String.format(mapper, "selectAll");
		List<MypageDTO> res = session.selectList(mapperId);
		return res;
	}
	public MypageDTO selectData() {
		String mapperId = String.format(mapper, "selectData");
		MypageDTO res = session.selectOne(mapperId);
		return res;
	}
	public boolean insertData(MypageDTO data) {
		String mapperId = String.format(mapper, "insertData");
		int res = session.insert(mapperId, data);
		return res == 1 ? true : false;
	}
	public boolean updateData(MypageDTO data) {
		String mapperId = String.format(mapper, "updateData");
		int res = session.update(mapperId, data);
		return res == 1 ? true : false;
	}
	public boolean deleteData(MypageDTO data) {
		String mapperId = String.format(mapper, "deleteData");
		int res = session.update(mapperId, data);
		return res == 1 ? true : false;
	}
}
