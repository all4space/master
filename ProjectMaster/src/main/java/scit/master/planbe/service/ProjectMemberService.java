package scit.master.planbe.service;

import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;


public interface ProjectMemberService {
			public ProjectVO MemberInvite(UsersVO vo); //������Ʈ ��� �ʴ�
			
			public boolean MemberInviteApproval(ProjectVO vo); //������Ʈ�� �ʴ���� ����� ����
			
			public boolean MemberDrop(UsersVO vo); // ������Ʈ ��� ����
			
			public ProjectVO DropRequest(ProjectVO vo); //������Ʈ '���'�� Ż�� ��û
			
			public boolean MemberDropApproval(ProjectVO vo); // ������Ʈ '�Ŵ���'�� ��� Ż�� ����
}
