package sist.co.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;
	private String ns="Event.";
	
	public void addEvent(EventDTO event) throws Exception {
		sqlSession.insert(ns + "addEvent", event);
	}
	
	public List<EventDTO> selectEventList(String yyyymm) {
		return sqlSession.selectList(ns + "selectEventList", yyyymm);
	}
	
	public EventDTO selectEventDetail(int seq) {
		return sqlSession.selectOne(ns + "selectEventDetail", seq);
	}
	/*
	public void insertEventInvite(EventInviteDTO memberList) {
		sqlSession.insert(ns + "insertEventInvite", memberList);
	}
	*/
	
	public void insertEventInvite(HashMap<String, List<EventInviteDTO>> inviteList) {
		sqlSession.insert(ns + "insertEventInvite", inviteList);
	}
	
	/*
	public void insertEventInvite(List<EventInviteDTO> memberList) {
		sqlSession.insert(ns + "insertEventInvite", memberList);
	}
	*/
}