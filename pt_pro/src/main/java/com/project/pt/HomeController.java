package com.project.pt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller //어노테이션
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class); // 로그 기능 : console에 뜨는 로그 메시지

	//url 주소와 메서드를 매핑해오는 것 : home이라는 메서드가 /라는 url 주소를 GET으로 요청해왔을 때 동작하는 메서드라는 뜻 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		// 의존성 주입(DI): new Date라는 객체 생성해서 할당
		// 제어역전Ioc(Inversion of Control) : 객체, 메서드의 호출을 외부(spring)에서 제어
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		// = request.setAttribute()
		model.addAttribute("serverTime", formattedDate );
		
		// = request.getRequestDispather(view).forward();
		return "home";
	}
	
}
