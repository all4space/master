package scit.master.planbe.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.dao.MemberDAOImpl;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAOImpl dao;
	
	



}
