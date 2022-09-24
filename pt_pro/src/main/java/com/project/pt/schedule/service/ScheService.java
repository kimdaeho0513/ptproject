package com.project.pt.schedule.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.schedule.model.ScheDAO;
import com.project.pt.schedule.vo.ScheVO;

@Service
public class ScheService {
	@Autowired(required = false)
	private ScheDAO dao;
	
	public ArrayList<ScheVO> scheList(){
		return dao.ScheList();
	}
}