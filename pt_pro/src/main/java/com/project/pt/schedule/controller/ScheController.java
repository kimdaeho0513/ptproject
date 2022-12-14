package com.project.pt.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pt.mem.model.MemDTO;
import com.project.pt.schedule.model.ScheDTO;
import com.project.pt.schedule.service.ScheService;


@Controller
@RequestMapping("/schedule")
public class ScheController {
	private static final Logger logger = LoggerFactory.getLogger(ScheController.class);


	@Autowired
	private ScheService service;

	@GetMapping
	public String list() {
		logger.info("list={}");

		return "schedule/schedule";
	}
	/*
	@GetMapping("schedule/alldata")
	public List<ScheDTO> data() {
		logger.info("data={}");

		return service.calenList();
	}
	*/
	
	@GetMapping("/data")
	@ResponseBody
	public List<ScheDTO> data(HttpSession session) {
		logger.info("data={}");
		
		int membercode = ((MemDTO) session.getAttribute("loginData")).getUserscode();

		return service.userCalenList(membercode);
	}

	@PostMapping("/add")
	@ResponseBody
	public boolean data(HttpSession session, String addSchedule) throws ParseException {
		logger.info("data={}");

		System.out.println(addSchedule);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		Date date = sdf.parse(addSchedule);
		
		System.out.println(date);
		
		int membercode = ((MemDTO) session.getAttribute("loginData")).getUserscode();

		return service.addCalenList(membercode,date);
	}
	
	@PostMapping(value="/delete")
	@ResponseBody
	public boolean deleteData(Integer id) {
		logger.info("{}", id);
		
		return service.deleteCalenList(id);
	}
}

