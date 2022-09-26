package com.bit.sm;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import sm.data.service.MemberServiceInter;

@Controller
public class HomeController {

@Autowired
MemberServiceInter serviceInter;
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("name", serviceInter.select());
		return "/sm1/layout/main";
	}
}
