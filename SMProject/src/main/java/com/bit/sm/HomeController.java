package com.bit.sm;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "/sm1/layout/main"; // WEB-INF/layout/main.jsp 가 메인페이지로
	}
	
}
