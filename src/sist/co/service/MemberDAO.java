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
	
}










