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
	
	String ns="NewsFeed.";

	public void writeNewsFeed(NewsFeedDTO dto){
		System.out.println("writeNewsFeed");
		sqlSession.insert(ns+"writeNewsFeed", dto);
	}
	
	
	public void writeNewsFeedImage(NewsFeedDTO dto){
		System.out.println("writeNewsFeedImage");
		sqlSession.insert(ns+"writeNewsFeedImage", dto);
		sqlSession.insert(ns+"writeNewsFeedImage2", dto);
	}
	
	
	
	

}






