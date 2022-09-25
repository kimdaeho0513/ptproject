package com.project.pt.schedule.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.schedule.model.ScheDAO;
import com.project.pt.schedule.model.ScheDTO;
import com.project.pt.schedule.vo.ScheVO;

@Service
public class ScheService {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheService.class);
	
	
	@Autowired(required = false)
	private ScheDAO dao;
	
	//public ArrayList<ScheVO> scheList(){
//		return dao.ScheList();
//	}

	public List<ScheDTO> calenList() {
		logger.info("ScheService.calenList()");
		return dao.ScheList();
	}
}