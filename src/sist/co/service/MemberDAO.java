package sist.co.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository	// 저장소
public class MemberDAO {
	
	@Autowired	// DI(의존성 주입)
	private SqlSession sqlSession;	
	
	private String ns="Member.";
	

	
}










