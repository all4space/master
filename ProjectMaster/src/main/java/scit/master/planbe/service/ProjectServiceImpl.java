package scit.master.planbe.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.dao.ProjectDAOImpl;
import scit.master.planbe.dao.UsersDAOImpl;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	ProjectDAOImpl dao;
	
	@Autowired
	UsersDAOImpl userDao;
	
	@Override
	public void projectAdd(UsersVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean projectModify(UsersVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean projectDelete(UsersVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<ProjectVO> getProjectList(UsersVO vo) {
		dao.getProjectList(vo);
		return null;
	}

	public ArrayList<UsersVO> groupNameList() {

		return dao.groupNameList();
	}

	public ArrayList<UsersVO> groupMemberList(String groupName) {

		return dao.groupMemberList(groupName);
	}
}
