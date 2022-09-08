package com.project.pt;

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
public class HomeController {

	@Autowired
	private ManagementService managementService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
		}
	
	/*@RequestMapping(value = "/7", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("home");
		
		List<ManagementDTO> Datas = managementService.getAll();
		model.addAttribute("Datas", Datas);
		return "index";
	}*/
}
	

