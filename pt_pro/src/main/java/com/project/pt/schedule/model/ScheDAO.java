package com.project.pt.schedule.model;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.pt.schedule.vo.ScheVO;

@Repository
public interface ScheDAO {
	//public ArrayList<ScheVO> ScheList();
	public ArrayList<ScheDTO> ScheList();
}