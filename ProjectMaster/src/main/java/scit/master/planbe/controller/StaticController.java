package scit.master.planbe.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import scit.master.planbe.service.StaticServiceImpl;

@RequestMapping("/static")
@Controller
public class StaticController {
	
	@Autowired
	StaticServiceImpl service;
	
	// Static 페이지 불러오기 
	@RequestMapping(value = "staticForm", method = RequestMethod.GET)
	public String staticForm() {
		return "staticForm";
	}
	
	
}
