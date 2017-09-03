package scit.master.planbe.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.dao.StaticDAOImpl;


@Service
public class StaticServiceImpl implements StaticService{

	@Autowired
	StaticDAOImpl dao;
	
	


}
