package scit.master.planbe.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession Sqlsession;

	public void ManagerAdd(MemberVO memberVo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		mapper.ManagerAdd(memberVo);
	}

	public void MemberAdd(MemberVO memberVo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		mapper.MemberAdd(memberVo);	
	}  
}
