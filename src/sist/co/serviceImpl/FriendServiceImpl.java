package sist.co.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.FriendDTO;
import sist.co.service.FriendDAO;
import sist.co.service.FriendService;
import sist.co.model.MemberDTO;

@Service
public class FriendServiceImpl implements FriendService{

	@Autowired
	private FriendDAO frienddao;
	
	@Override
	public List<FriendDTO> getFriendsList(String m_id) throws Exception {
		return frienddao.getFriendsList(m_id);
	}

	@Override
	public MemberDTO getFriendsInformation(String f_id) throws Exception {
		return frienddao.getFriendsInformation(f_id);
	}

	@Override
	public List<FriendDTO> getAskFriendsList(String m_id) throws Exception {
		return frienddao.getAskFriendsList(m_id);
	}

	@Override
	public List<FriendDTO> getAnsFriendsList(String m_id) throws Exception {
		return frienddao.getAnsFriendsList(m_id);
	}
	
	//그룹별 친구 관리
	@Override
	public List<String> getFamilyList(String m_id) throws Exception {
		return frienddao.getFamilyList(m_id);
	}

	@Override
	public List<String> getBestFriendsList(String m_id) throws Exception {
		return frienddao.getBestFriendsList(m_id);
	}

	@Override
	public List<FriendDTO> getKnowList(String m_id) throws Exception {
		return frienddao.getKnowList(m_id);
	}

	@Override
	public List<String> getBlockList(String m_id) throws Exception {
		return frienddao.getBlockList(m_id);
	}

	// 친구가 맺은 총 친구 인원수 출력
	@Override
	public int getFriendsTotalNumOfFriends(String m_id) throws Exception {	
		return frienddao.getFriendsTotalNumOfFriends(m_id);
	}
	
	

	
	
}
