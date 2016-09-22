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
	
	
	@Override
	@Transactional(readOnly=true)
	public int check_member(MemberDTO member) throws Exception {
		
		return MemberDAO.check_member(member);
	}


	@Override
	public boolean add_member(MemberDTO member) throws Exception {
		
		return MemberDAO.add_member(member);
	}


	@Override
	public MemberDTO login(MemberDTO member) throws Exception {
		
		return MemberDAO.login(member);
	}


	@Override
	public boolean change_m_office(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.change_m_office(member);
	}


	@Override
	public MemberDTO login2(MemberDTO member) throws Exception {
		
		return MemberDAO.login2(member);
	}


	@Override
	public boolean change_m_highschool(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.change_m_highschool(member);
	}


	@Override
	public boolean change_m_university(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.change_m_university(member);
	}

	@Override
	public boolean change_m_marriage(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.change_m_marriage(member);
	}


	@Override
	public boolean change_m_content(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.change_m_content(member);
	}
	

	
	
	
	
	

	
}
