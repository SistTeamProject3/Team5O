package sist.co.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.FriendDTO;
import sist.co.model.MemberDTO;

@Repository
public class FriendDAO {

	@Autowired
	private SqlSession sqlSession;
	private String ns="Friend.";
	
	public List<FriendDTO> getFriendsList(String m_id) throws Exception{
		List<FriendDTO> list = new ArrayList<FriendDTO>();
		list = sqlSession.selectList(ns+"getFriendsList", m_id);
		return list;
	}
	
	public MemberDTO getFriendsInformation(String f_id) throws Exception{
		return sqlSession.selectOne(ns+"getFriendsInformation", f_id);
	}
	
	public List<FriendDTO> getAskFriendsList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getAskFriendsList", m_id);
	}
	
	public List<FriendDTO> getAnsFriendsList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getAnsFriendsList", m_id);
	}

	//그룹별 친구 리스트
	public List<String> getFamilyList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getFamilyList", m_id);
	}

	public List<String> getBestFriendsList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getBestFriendsList", m_id);
	}

	public List<FriendDTO> getKnowList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getKnowList", m_id);
	}
	
	public List<String> getBlockList(String m_id) throws Exception{
		return sqlSession.selectList(ns+"getBlockList", m_id);
	}
	
	//친구가 맺은  총 친구 인원수 출력 
	public int getFriendsTotalNumOfFriends(String m_id) throws Exception{
		return sqlSession.selectOne(ns+"getFriendsTotalNumOfFriends", m_id);
	}
	
	
	
	
	
	
	
	
	
	
	
}
