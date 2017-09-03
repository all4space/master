package scit.master.planbe.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import scit.master.planbe.service.MemberServiceImpl;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "memberForm", method = RequestMethod.GET)
	public String memberForm() {
		return "memberForm";
	}
	
	
}
