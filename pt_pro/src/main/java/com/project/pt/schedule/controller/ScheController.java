package com.project.pt.schedule.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}

