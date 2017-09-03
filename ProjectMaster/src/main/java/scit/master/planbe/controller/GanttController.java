package scit.master.planbe.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import scit.master.planbe.service.GanttServiceImpl;

@RequestMapping("/gantt")
@Controller
public class GanttController {
	
	@Autowired
	GanttServiceImpl service;
	
	// Gantt 페이지 불러오기 
	@RequestMapping(value = "ganttForm", method = RequestMethod.GET)
	public String ganttForm() {
		return "ganttForm";
	}
	
	
}
