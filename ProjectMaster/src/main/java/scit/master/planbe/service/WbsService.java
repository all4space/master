package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;

public interface WbsService {
	
	// TaskList 가져오기 : 동일한 프로젝트에 속한 Task들을 전부 가져오는 메소드. 
	public ArrayList<TaskVO> getTaskList(int projectNo); 
	
	// 키워드에 속하는 TaskList 가져오기  : 동일한 프로젝트 내에서, 키워드에 해당하는 Task들만 가져오는 메소드.   
	public ArrayList<TaskVO> getTaskListByKey(String keyword);
	
	// Project 정보 가져오기 : 하나의 Project의 정보를 가져오는 메소드.  
	public ProjectVO getProjectInfo(int projectNo); 
	
	// Task 정보 가져오기 : 하나의 Task의 정보를 가져오는 메소드. 
	public TaskVO getTaskInfo(int taskNo); 
	
	// Task 정보 가져오기 : 하나의 Task의 정보를 가져오는 메소드. 
	public TaskVO getTaskInfo(TaskVO vo); 
	
	// MemberList 가져오기 : 동일한 프로젝트에 속한 Member들을 전부 가져오는 메소드. 
	public ArrayList<String> getMemberList(int projectNo);
	
	// doneList 가져오기 
	public ArrayList<TaskVO> doneList(int projectNo, int key);
	
}
	
