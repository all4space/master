package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.TaskVO;

public interface TaskService {

public void TaskList();//업무 리스트 표시 

public void TaskUpdate(TaskVO task);//업무 리스트 수정

public void TaskDelete(TaskVO task);//업무 리스트 삭제 

public ArrayList<TaskVO> Day(TaskVO task);//일별 업무 리스트

public ArrayList<TaskVO> Week(TaskVO task);//주별 업무 리스트

public ArrayList<TaskVO> Month(TaskVO task);//월별 업무 리스트

public ArrayList<TaskVO> Search(TaskVO task);//업무 리스트 검색

public ArrayList<TaskVO> Insert(TaskVO task);//업무 리스트 생성.

public void DownLoad(TaskVO task);//다운로드.

public ArrayList<MemberVO>ContactInfo();//컨텍트 정보.
	
	
}

