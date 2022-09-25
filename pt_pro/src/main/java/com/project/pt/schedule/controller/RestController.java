package com.project.pt.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.pt.mem.model.MemDTO;
import com.project.pt.schedule.model.ScheDTO;
import com.project.pt.schedule.service.ScheService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private ScheService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ScheController.class);
	
	@GetMapping("schedule/data")
	public List<ScheDTO> data() {
		logger.info("data={}");

		return service.calenList();
	}
	
	public List<ScheDTO> data(HttpSession session) {
		logger.info("data={}");
		
		int membercode = ((MemDTO) session.getAttribute("loginData")).getUserscode();

		return service.userCalenList(membercode);
	}

}
