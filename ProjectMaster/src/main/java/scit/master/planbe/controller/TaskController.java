package scit.master.planbe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import scit.master.planbe.service.TaskServiceImpl;


@RequestMapping("/task")
@Controller
public class TaskController {
	
	@Autowired
	TaskServiceImpl service;
	
	// taskForm 불러오기 
	@RequestMapping(value = "taskForm", method = RequestMethod.GET)
	public String taskForm() {
		return "taskForm";
	}
	
}
	
	

	
	
