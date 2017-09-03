package scit.master.planbe.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StaticDAOImpl implements StaticDAO {

	@Autowired
	SqlSession Sqlsession;  
	
	
	

}
