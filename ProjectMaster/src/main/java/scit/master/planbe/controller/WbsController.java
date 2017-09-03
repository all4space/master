package scit.master.planbe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.service.WbsServiceImpl;

@RequestMapping("/wbs")
@Controller
public class WbsController {
	
	@Autowired
	WbsServiceImpl service;
	
	// WBS 페이지 불러오기 
	@RequestMapping(value = "wbsForm", method = RequestMethod.GET)
	public String wbsForm() {
		return "wbsForm";
	}
	
	// WBS 데이터 불러오기  
	@RequestMapping(value = "getWbs", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getWbs(int projectNo) {
		// projectName 가져오기   
		ProjectVO vo = service.getProjectInfo(projectNo);
	    // 프로젝트에 속한 TaskList 가져오기 
	    ArrayList<TaskVO> taskList = service.getTaskList(projectNo);
        
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("projectName", vo.getProjectName()); 
	    map.put("taskList", taskList);
	    
	    return map;
	}
	    
	// memberList 불러오기 
	@RequestMapping(value = "getMemberList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<String> getMemberList(int projectNo) {
		System.out.println("프넘" + projectNo);
		ArrayList<String> memberList = service.getMemberList(projectNo);
		return memberList;
	}	
	
	// keyList 불러오기 
	@RequestMapping(value = "doneList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<TaskVO> doneList(int projectNo, int key) {
		System.out.println("프넘" + key);
		ArrayList<TaskVO> list = service.doneList(projectNo, key);
		return list;
		
	}	
}
