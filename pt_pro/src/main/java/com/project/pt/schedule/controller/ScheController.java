package com.project.pt.schedule.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.schedule.service.ScheService;


@Controller
public class ScheController {
	private static final Logger logger = LoggerFactory.getLogger(ScheController.class);


	/*
	@Autowired
	private ScheService service;
	*/
	@RequestMapping(value="/schedule", method=RequestMethod.GET)
	public String schedule() {
		return "schedule/schedule";
	}


}
