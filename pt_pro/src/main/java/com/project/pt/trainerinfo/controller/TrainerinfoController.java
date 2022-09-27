package com.project.pt.trainerinfo.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.pt.management.model.ManagementDTO;
import com.project.pt.management.service.ManagementService;


@Controller
public class TrainerinfoController {

	private static final Logger logger = LoggerFactory.getLogger(TrainerinfoController.class);
	



	@RequestMapping(value = "/trainerinfo")
	public String home(Locale locale, Model model) {

		return "/trainerinfo/trainerinfo";
	}
}
		/*******/

	