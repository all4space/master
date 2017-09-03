package scit.master.planbe.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;

@Repository
public class WbsDAOImpl implements WbsDAO {

	@Autowired
	SqlSession Sqlsession;  
	
	@Override
	public ArrayList<TaskVO> getTaskList(int projectNo) {
		WbsMapper mapper = Sqlsession.getMapper(WbsMapper.class);
		return mapper.getTaskList(projectNo);
	}

	@Override
	public ArrayList<TaskVO> getTaskListByKey(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectVO getProjectInfo(int projectNo) {
		WbsMapper mapper = Sqlsession.getMapper(WbsMapper.class);
		return mapper.getProjectInfo(projectNo);
	}

	@Override
	public TaskVO getTaskInfo(int taskNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<String> getMemberList(int projectNo) {
		WbsMapper mapper = Sqlsession.getMapper(WbsMapper.class);
		return mapper.getMemberList(projectNo);
	}

/*
	@Override
	public ArrayList<TaskVO> doneList(int key) {
		WbsMapper mapper = Sqlsession.getMapper(WbsMapper.class);
		return mapper.doneList(key);
	}
*/
	

}
