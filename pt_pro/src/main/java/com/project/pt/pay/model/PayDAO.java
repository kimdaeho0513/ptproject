package com.project.pt.pay.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pt.pay.vo.PayVO;

@Repository
public class PayDAO {

	
	@Autowired
	private SqlSession session;
	
	private String mapper = "payMapper.%s";
	
	public boolean updateData(PayVO data) {
		String mapperId = String.format(mapper, "updatePtCount");
		int res = session.update(mapperId, data);
		return res == 1 ? true : false;
	}
	
	public int selectData(int mem_user) {
		String mapperId = String.format(mapper, "selectPtCount");
		int res = session.selectOne(mapperId, mem_user);
		return res;
	}

}
