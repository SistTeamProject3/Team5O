package sist.co.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.model.MemberDTO;
import sist.co.service.MemberDAO;
import sist.co.service.MemberService;


@Service
public class MemberImpl implements MemberService {

	@Autowired 
	MemberDAO MemberDAO;
	/*
	@Override
	@Transactional(readOnly=true)
	public SistMemberDTO login(SistMemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return sistMemberDao.login(member);
	}

	@Override
	@Transactional
	public boolean addMember(SistMemberDTO member) throws Exception {		
		return sistMemberDao.addMember(member);		
	}
*/

	
	
	
	@Override
	@Transactional(readOnly=true)
	public int check_member(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.check_member(member);
	}
	
	
	
	

	
}
