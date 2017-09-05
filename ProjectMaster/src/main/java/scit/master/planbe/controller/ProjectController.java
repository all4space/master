package scit.master.planbe.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.service.ProjectServiceImpl;

@RequestMapping("/project")
@Controller
public class ProjectController {
	
	@Autowired
	ProjectServiceImpl service;

	// group Name List 불러오기
	@RequestMapping(value = "projectForm", method = RequestMethod.GET)
	public ModelAndView projectForm() {
		ModelAndView mov = new ModelAndView("/projectForm");
		mov.addObject("groupNameList", service.groupNameList());
		System.out.println("mov? " + mov.toString());
		
		return mov;
	}
	
	// group Member List 불러오기 ajax;
	@RequestMapping(value = "groupMemberList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<UsersVO> groupMemberList(String groupName) {
		
		System.out.println("여기는요"
				+ service.groupMemberList(groupName));
		return service.groupMemberList(groupName);
	}
		
		
}

