package sist.co.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.NewsFeedDTO;

@Repository
public class NewsFeedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String ns="SistPDS.";

	public void writeNewsFeed(NewsFeedDTO dto){
		sqlSession.insert(ns+"writeNewsFeed", dto);
	}
	
	
	
	

}






