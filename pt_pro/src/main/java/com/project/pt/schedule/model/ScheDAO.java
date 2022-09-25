package com.project.pt.schedule.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pt.schedule.vo.ScheVO;

@Repository
public class ScheDAO {
	//public ArrayList<ScheVO> ScheList();
	
	private static final Logger logger = LoggerFactory.getLogger(ScheDAO.class);
	
	@Autowired
	private SqlSession session; 
	
	private String mapper ="scheMapper.%s";
	
	public List<ScheDTO> ScheList(){
		String mapperId = String.format(mapper, "scheList");
		List<ScheDTO> result = session.selectList(mapperId);
		logger.info("{}",result);
		return result;
		
	}
	
	public List<ScheDTO> userScheList(int membercode) {
		String mapperId = String.format(mapper, "userScheList");
		List<ScheDTO> result = session.selectList(mapperId, membercode);
		logger.info("{}",result);
		return result;
				
		
	}
}