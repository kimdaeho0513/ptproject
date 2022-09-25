package com.project.pt.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pt.mem.model.MemDTO;
import com.project.pt.schedule.model.ScheDTO;
import com.project.pt.schedule.service.ScheService;

@Controller
@RequestMapping("/trschedule")
public class TrScheController {
	private static final Logger logger = LoggerFactory.getLogger(ScheController.class);


	@Autowired
	private ScheService service;

	@GetMapping
	public String list() {
		logger.info("list={}");

		return "schedule/trschedule";
	}
	
	@GetMapping("/data")
	@ResponseBody
	public List<ScheDTO> data(HttpSession session) {
		logger.info("data={}");
		
		int coachcode = ((MemDTO) session.getAttribute("loginData")).getUserscode();

		return service.trainerCalenList(coachcode);
	}
	
	
	@PostMapping(value="/delete")
	@ResponseBody
	public boolean deleteData(Integer id) {
		logger.info("{}", id);
		
		return service.deleteCalenList(id);
	}

}
