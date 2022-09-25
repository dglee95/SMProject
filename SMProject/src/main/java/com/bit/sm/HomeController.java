package com.bit.sm;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import sm.data.service.MemberServiceInter;

@Controller
public class HomeController {


	
	@GetMapping("/")
	public String home() {
		return "/sm1/layout/main";
	}
}
