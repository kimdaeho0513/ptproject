package com.project.pt.login.model;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pt.mem.model.MemDTO;

@Repository
public class LoginDAO {
	private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	@Autowired
	private SqlSession session;
	
	public MemDTO selectLogin(MemDTO data) {
		logger.info("selectLogin({})",data);
		MemDTO result = session.selectOne("loginMapper.selectLogin", data);
		logger.info("selectLogin({})",result);
		return result;
	}

	public MemDTO selectId(MemDTO data) {
		logger.info("selectid({})",data);
		MemDTO result = session.selectOne("loginMapper.selectId", data);
		logger.info("selectid({})",result);
		return result;
	}

	public MemDTO selectPw(MemDTO data) {
		logger.info("selectpw({})",data);
		MemDTO result = session.selectOne("loginMapper.selectPw", data);
		logger.info("selectpw_after({})",result);
		return result;
	}

	public boolean updatePw(MemDTO data) {
		logger.info("updatepw({})",data);
		
		int res = session.update("loginMapper.updatePw", data);
		return res == 1 ? true : false;
	}

	public boolean insertMem(MemDTO data) {
		logger.info("insertMem({}",data);
		
		int res = session.insert("loginMapper.insertMem", data);
		return res == 1 ? true : false;
	}

}
