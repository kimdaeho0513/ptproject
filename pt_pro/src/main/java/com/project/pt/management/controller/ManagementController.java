package com.project.pt.management.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.project.pt.common.util.Paging;
import com.project.pt.management.model.ManagementDTO;
import com.project.pt.management.service.ManagementService;

@Controller
@RequestMapping(value="/management")
public class ManagementController {
	
	@Autowired
	private ManagementService service;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String getList(Model model, HttpSession session
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount) {
		List datas = service.getAll();
		
		if(session.getAttribute("pageCount") == null) {
			session.setAttribute("pageCount", 5);
		}
		
		if(pageCount > 0) {
			session.setAttribute("pageCount", pageCount);
		}
		
		pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
		Paging paging = new Paging(datas, page, pageCount);
		
		model.addAttribute("datas", paging.getPageData());
		model.addAttribute("pageData", paging);
		
		
			return "management/list";	
		}
	
	@GetMapping(value="/detail")
	public String getDetail(Model model
			, HttpSession session
			, @RequestParam(defaultValue="0", required=false) int mngNum) {
		ManagementDTO data = service.getData(mngNum);
		List<ManagementDTO> datas = service.detailDatas();
		model.addAttribute("data", data);
		model.addAttribute("datas", datas);
		
		if(data == null) {
			model.addAttribute("data", data);
			return "management/detail";
		} else {
			return "management/list";
		}
	
	}

}

