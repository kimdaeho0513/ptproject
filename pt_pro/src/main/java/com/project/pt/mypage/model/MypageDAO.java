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
	

	public MypageDTO selectData(int usercode) {
		String mapperId = String.format(mapper, "selectData");
		MypageDTO res = session.selectOne(mapperId, usercode);
		return res;
	}
	public MypageDTO selectPtdata(int usercode) {
		String mapperId = String.format(mapper, "selectPtdata");
		MypageDTO res = session.selectOne(mapperId, usercode);
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
