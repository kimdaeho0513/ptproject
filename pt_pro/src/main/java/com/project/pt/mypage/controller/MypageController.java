package com.project.pt.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.pt.mypage.model.MypageDTO;
import com.project.pt.mypage.service.MypageService;


@Controller

public class MypageController {
	@Autowired
	private MypageService service;
	
	@RequestMapping(value="/mypage")
	public String mypage(Model model, HttpSession session) {
		
		
			
		MypageDTO data = service.getData();
		model.addAttribute("data", data);
		
		return "mypage/mypage";
	}
	/*
	 * @RequestMapping(value="/update") public String mypageupdate(Model model,
	 * HttpSession session) {
	 * 
	 * 
	 * 
	 * MypageDTO data = service.modify(????); model.addAttribute("data", data);
	 * 
	 * return "mypage/mypage"; }
	 * 
	 * @RequestMapping(value="/delete") public String mypagedelete(Model model,
	 * HttpSession session) {
	 * 
	 * 
	 * 
	 * MypageDTO data = service.delete(????); model.addAttribute("data", data);
	 * 
	 * return "mypage/mypage"; }
	 */
}
