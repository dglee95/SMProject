package sm.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sm.data.dao.MemberDaoInter;

@Service
public class MemberService implements MemberServiceInter {
	
	@Autowired
	MemberDaoInter daoInter;
	
	@Override
	public int select() {
		// TODO Auto-generated method stub
		return daoInter.select();
	}

}
