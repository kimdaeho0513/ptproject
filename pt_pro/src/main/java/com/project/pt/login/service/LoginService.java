package com.project.pt.login.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.pt.login.model.LoginDAO;
import com.project.pt.login.vo.FindVO;
import com.project.pt.login.vo.LoginVO;
import com.project.pt.login.vo.SignupVO;
import com.project.pt.mem.model.MemDTO;

@Service
public class LoginService {
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired
	private LoginDAO dao;
	
	public boolean getLogin(HttpSession session, LoginVO loginVo) {
		logger.info("getLogin({},{})",session,loginVo);
		
		MemDTO data = new MemDTO();
		data.setUserid(loginVo.getUserid());
		data.setPw(loginVo.getPw());
		data.setRoles(loginVo.getRoles());
		data = dao.selectLogin(data);
		
		if(data == null) {
			return false;
		} else {
			session.setAttribute("loginData", data);
			System.out.println(session.getAttribute("loginData"));
			return true;
		}
		
	}

	public boolean getId(HttpSession session, FindVO fv) {
		logger.info("getid({},{})",session,fv);
		
		MemDTO data = new MemDTO();
		data.setName(fv.getName());
		data.setPhone(fv.getPhone());
		data = dao.selectId(data);
		
		if(data == null) {
			System.out.println("실패");
			return false;
			
			
		} else {
			session.setAttribute("findId", data);
			System.out.println("성공");
			return true;
		}
	}

	public boolean getPw(HttpSession session, FindVO fv) {
		logger.info("getpw({},{})",session,fv);
		
		MemDTO data = new MemDTO();
		data.setName(fv.getName());
		data.setUserid(fv.getUserid());
		data.setEmail(fv.getEmail());
		data = dao.selectPw(data);
		
		if(data == null) {
			return false;
			
		} else {
			session.setAttribute("findPw", data);
			return true;
		}
	}

	public boolean modifyPw(LoginVO lv) {
		logger.info("modifyPw({})",lv);
		
		MemDTO data = new MemDTO();
		data.setUserid(lv.getUserid());
		data.setPw(lv.getPw());
		
		boolean result = dao.updatePw(data);
		return result;
	}

	public boolean addMem(HttpSession session, SignupVO sv) {
        logger.info("addMem({},{})",session,sv);

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(sv.getBirth());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        MemDTO data = new MemDTO();
        data.setName(sv.getName());
        data.setUserid(sv.getUserid());
        data.setPw(sv.getPw());
        data.setEmail(sv.getEmail());
        data.setPhone(sv.getPhone());
        data.setBirth(date);
        data.setGender(sv.getGender());

        boolean result=dao.insertMem(data);
        if(result) {
            System.out.println("회원가입 성공");
            return true;
        }else {
            System.out.println("회원가입 실패");
            return false;
        }
    }
}
