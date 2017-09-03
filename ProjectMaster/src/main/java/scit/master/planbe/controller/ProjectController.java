package scit.master.planbe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import scit.master.planbe.service.ProjectServiceImpl;

@RequestMapping("/project")
@Controller
public class ProjectController {
	
	@Autowired
	ProjectServiceImpl service;

	// 
	@RequestMapping(value = "projectForm", method = RequestMethod.GET)
	public String projectForm() {
		return "projectForm";
	}

		
		
}

