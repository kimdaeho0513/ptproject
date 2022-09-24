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
import com.project.pt.common.util.Search;
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
		
		//트레이너만 조회
		List<ManagementDTO> listTrainer = service.selectTrainer();
		model.addAttribute("listTrainer", listTrainer); //트레이너를 모델에 저장
		
		ManagementDTO All = service.getAllData(mngNum); //모든데이터 조회
		model.addAttribute("All", All);	//모든데이터를 ALL에 저장 -> JSTL 사용
		
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
		
		//dto에 detail.jsp에서 submit으로 데이터를 보냄	
		if(dto != null) { //dto 값이 널이 아니면
			service.updateMember(dto);  //dto의 Member를 업데이트 해라
			System.out.println("if문 업데이트 확인용 " + dto);
			service.updatePt(dto); //dto의 Pt를 업데이트 해라
			System.out.println("if문 업데이트 확인용 " + dto);
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
		
		if(data == null) { //삭제할 데이터 없음
			return "management/null";
		} else {//삭제할 데이터가 있으면 데이터 삭제를 실행하고
			boolean result = service.remove(data);
			if(result) {//실행했다면 리다이렉트를 실행해라
				return "redirect:/management";
			}
		}
		return "management/list";
	}
	
}

