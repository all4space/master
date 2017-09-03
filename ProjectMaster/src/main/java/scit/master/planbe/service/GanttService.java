package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;

public interface GanttService {
	//Gantt
	public void taskAdd(TaskVO vo); //업무 추가
	public boolean taskModify(TaskVO vo); //업무 수정 & 완료(==업데이트)
	public boolean taskDelete(TaskVO vo); // 업무 삭제
	
	
	/*업무 그래프 : 시각화(일,주,달)는 컨트롤러에서 명령받을 것
	 **			서비스는 하나에서 일,주,달로 쪼개어 리턴함. 명령값(action) 받을거임
	 */
	public ArrayList<TaskVO> taskSerialize(UsersVO vo);
	//히스토리 가져오기
	public ArrayList<HistoryVO> getHistoryList();
	public void historyAdd(HistoryVO vo); //히스토리 추가 (log 는 sysdate)
}
