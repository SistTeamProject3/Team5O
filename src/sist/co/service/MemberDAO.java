package sist.co.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.MemberDTO;




@Repository	// 저장소
public class MemberDAO {
	
	@Autowired	// DI(의존성 주입)
	private SqlSession sqlSession;	
	
	private String ns="Member.";
	
	
	public int check_member(MemberDTO member)throws Exception {
		
		return (int)sqlSession.selectOne(ns+"check_member", member);
	}
	public boolean add_member(MemberDTO member)throws Exception{
		sqlSession.insert(ns+"add_Member", member);
		return true;
	}
	public MemberDTO login(MemberDTO member) throws Exception{

		return sqlSession.selectOne(ns+"login", member);
		
	}
	
	public MemberDTO login2(MemberDTO member) throws Exception{
		return sqlSession.selectOne(ns+"login2", member);	
	}
	
	public boolean change_m_office(MemberDTO member) throws Exception{

		sqlSession.update(ns+"change_m_office", member);
		return true;
	}
	public boolean change_m_highschool(MemberDTO member) throws Exception{

		sqlSession.update(ns+"change_m_highschool", member);
		return true;
	}
	public boolean change_m_university(MemberDTO member) throws Exception{
		sqlSession.update(ns+"change_m_university", member);
		return true;
	}
	
	public boolean change_m_marriage(MemberDTO member) throws Exception{
		sqlSession.update(ns+"change_m_marriage", member);
		return true;
	}
	
	public boolean change_m_content(MemberDTO member) throws Exception{
		sqlSession.update(ns+"change_m_content", member);
		return true;
	}
	
	
	

}










