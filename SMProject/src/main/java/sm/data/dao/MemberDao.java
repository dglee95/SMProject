package sm.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	SqlSession session;
	
	String ns="sm.data.dao.MemberDao.";
	@Override
	public int select() {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"select");
	}

}
