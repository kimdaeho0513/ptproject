package com.project.pt.management.controller;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.pt.common.util.Paging;
import com.project.pt.management.model.ManagementDTO;
import com.project.pt.management.model.MemberDTO;
import com.project.pt.management.service.ManagementService;

@Controller
@RequestMapping(value="/management")
public class ManagementController {
	
	
	@Autowired
	private ManagementService service;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String getList(Model model, HttpSession session
			, @RequestParam(required = false) String search
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount ) {
			
		
		List datas = service.listSearch(search);
		
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
		model.addAttribute("page", page);
		
		return "management/list";	
		}

	@GetMapping(value="/detail")
	public String getDetail(Model model
			, HttpSession session
			, @RequestParam(defaultValue="0", required=false) int mngNum) {
		
		//??????????????? ??????
		List<ManagementDTO> listTrainer = service.selectTrainer();
		model.addAttribute("listTrainer", listTrainer); //??????????????? ????????? ??????
		
		ManagementDTO All = service.getAllData(mngNum); //??????????????? ??????
		model.addAttribute("All", All);	//?????????????????? ALL??? ?????? -> JSTL ??????
		
		if(All != null) {
			return "management/detail";
		} else {
			return "management/list";
		}
	}
	
	@PostMapping(value = "/modify")
	public String modify(
		 Model model
		, @RequestParam (defaultValue="0", required=false) int mngNum
		, @ModelAttribute ManagementDTO dto
		, HttpSession session) {
		
		//dto??? detail.jsp?????? submit?????? ???????????? ??????	
		if(dto != null) { //dto ?????? ?????? ?????????
			service.updateMember(dto);  //dto??? Member??? ???????????? ??????
			System.out.println("if??? ???????????? ????????? " + dto);
			service.updatePt(dto); //dto??? Pt??? ???????????? ??????
			System.out.println("if??? ???????????? ????????? " + dto);
		return "redirect:/management";
		}
		return "management/list";
	}
	
	@PostMapping("/delete")
	public String memberDelete(
			  @RequestParam (defaultValue="0", required=false) int mngNum
			 , HttpSession session
			 , Model model) {
		
		ManagementDTO data = service.getData(mngNum);
		
		if(data == null) { //????????? ????????? ??????
			return "management/null";
		} else {//????????? ???????????? ????????? ????????? ????????? ????????????
			boolean result = service.remove(data);
			if(result) {//??????????????? ?????????????????? ????????????
				return "redirect:/management";
			}
		}
		return "management/list";
	}
	
}

