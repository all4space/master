package scit.master.planbe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.dao.TaskDAOImpl;

@Service
public class TaskServiceImpl implements TaskService{

	@Autowired
	TaskDAOImpl dao;

	@Override
	public void TaskList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void TaskUpdate(TaskVO task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void TaskDelete(TaskVO task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<TaskVO> Day(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TaskVO> Week(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TaskVO> Month(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TaskVO> Search(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TaskVO> Insert(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void DownLoad(TaskVO task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<MemberVO> ContactInfo() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	


	
}



	






	




