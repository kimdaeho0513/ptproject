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
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount
			, @RequestParam(required=false) String mngRole) {
		List datas = service.getAll();
		List trainer = service.getTrainers();
		List member = service.getMembers();
		
//		if(session.getAttribute(mngRole) == null) {
//			datas = service.getAll();
//		}	
//		if(session.getAttribute("mngRole") == "T" ) {
//			//data = service.getTrainer(mngRole);
//			session.setAttribute("datas", trainer);
//		}	
//		if(session.getAttribute("mngRole") == "M") {
//				//data = service.getMember(mngRole);	
//			session.setAttribute("datas", member);
//		}
	

		
	
		
		if(session.getAttribute("pageCount") == null) {
			session.setAttribute("pageCount", 5);
		}
		
		if(pageCount > 0) {
			session.setAttribute("pageCount", pageCount);
		}
		
		pageCount = Integer.parseInt(session.getAttribute("pageCount").toString());
		Paging paging = new Paging(datas, page, pageCount);
		
		model.addAttribute("datas", paging.getPageData());
		model.addAttribute("trainer", paging.getPageData());
		model.addAttribute("member", paging.getPageData());
		model.addAttribute("pageData", paging);
		//model.addAttribute("mngRole", mngRole);
		//model.addAttribute("data", data);

		return "management/list";	
		}
	
	@GetMapping(value="/detail")
	public String getDetail(Model model
			, HttpSession session
			, @RequestParam(defaultValue="0", required=false) int mngNum) {
		ManagementDTO data = service.getData(mngNum);
		model.addAttribute("data", data); //users데이터를 모델에 저장
 		MemberDTO datas = service.memberDatas(mngNum);
		model.addAttribute("datas", datas); //pt카운트 pt선생 정보를 모델에 저장
		
		if(data != null) {
			return "management/detail";
		} else {
			return "management/list";
		}
	}
	@PostMapping
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model,
		@ModelAttribute ManagementDTO dto) {
		
		boolean result = service.check(dto.getMngId(), dto.getMngPass());
		if(result) { //비밀번호 일치시 수정 처리후 회원목록으로 리다이렉트
			service.updateMember(dto);
			return "redirect:/management/list";
		} else { //비밀번호 불일치시 메세지 출력
			model.addAttribute("data", dto);
			model.addAttribute("mesage", "비밀번호 불일치");
		}
		
		return "management/detail";
	}
	
	@PostMapping("/delete")
	public String memberDelete(ManagementDTO dto
			 , @RequestParam (defaultValue="0", required=false) int mngNum
			 , HttpSession session
			 , Model model) {
		
		ManagementDTO data = service.getData(mngNum);
		
		session.getAttribute("mngNum");
		//비밀번호 체크
		//boolean result = service.check(mngId, mngPass);
		if(data == null) { //삭제할 데이터 없음
			return "management/null";
		} else {
			boolean result = service.remove(data);
			if(result) {
				return "redirect:/management";
			}
		}
		return "management/list";
	}
	
}

