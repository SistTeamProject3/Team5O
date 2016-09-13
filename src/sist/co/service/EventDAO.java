package sist.co.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.EventDTO;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;
	private String ns="Event.";
	
	public void addEvent(EventDTO event) throws Exception {
		sqlSession.insert(ns + "addEvent", event);
	}
}