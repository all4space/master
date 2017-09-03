package scit.master.planbe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.dao.GanttDAOImpl;
import scit.master.planbe.dao.ProjectDAOImpl;

@Service
public class GanttServiceImpl implements GanttService{

	@Autowired
	GanttDAOImpl dao;
	
	

	@Override
	public void taskAdd(TaskVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean taskModify(TaskVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean taskDelete(TaskVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<TaskVO> taskSerialize(UsersVO vo) { // Gantt Chart 구현
		
		ArrayList<TaskVO> taskList = null; 
        /*
		MemberVO m_vo = dao.getMemberNo(vo);
		if(m_vo != null){
			taskList = dao.taskSerialize(m_vo);
		}
		*/
		return taskList;
	}

	@Override
	public ArrayList<HistoryVO> getHistoryList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void historyAdd(HistoryVO vo) {
		// TODO Auto-generated method stub
		
	}


}
