package com.project.pt.schedule.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.pt.mem.model.MemDTO;
import com.project.pt.schedule.vo.ScheVO;

@Repository
public class ScheDAO {
	//public ArrayList<ScheVO> ScheList();

	private static final Logger logger = LoggerFactory.getLogger(ScheDAO.class);

	@Autowired
	private SqlSession session; 

	private String mapper ="scheMapper.%s";	
	private String total ="boardMapper.%s";	

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

	public boolean addScheList(int membercode, Date date) {
		String mapperId = String.format(mapper, "addScheList");
		String mapperId2 = String.format(mapper, "check");
		String mapperId3 = String.format(total, "getTrainer3");
		MemDTO coachData=session.selectOne(mapperId3,membercode);
		
		Map<String,Object> data = new HashMap<>();
		data.put("membercode", membercode);
		data.put("coachCode", coachData.getUserscode());
		data.put("name", coachData.getName());
		data.put("date", date);

		if((int)session.selectOne(mapperId2,data)==0) {
			int res =session.insert(mapperId,data);
			if(res >= 1) {
				return true;
			}		
		}
		return false;
	}

	public boolean deleteScheList(int id) {
		String mapperId = String.format(mapper, "deleteScheList");
		return session.delete(mapperId, id) == 0 ? false : true;
	}
	
	
	//trScheController 관련 dao
	public List<ScheDTO> trainerScheList(int coachcode) {
		String mapperId = String.format(mapper, "trainerScheList");
		List<ScheDTO> result = session.selectList(mapperId, coachcode);
		logger.info("{}",result);
		result.forEach(x -> {
			x.setTitle(session.selectOne("boardMapper.getMember", x.getMembercode()));
		});
		return result;			
	}
	
	
}