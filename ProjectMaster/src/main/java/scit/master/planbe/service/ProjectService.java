package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;

public interface ProjectService { //생성
	
	public int projectAdd(ProjectVO projectVo);
	public boolean projectModify(UsersVO vo);
	public boolean projectDelete(UsersVO vo);
	public ArrayList<ProjectVO> getProjectList(UsersVO vo);
}
