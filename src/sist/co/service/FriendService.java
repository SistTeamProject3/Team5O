package sist.co.service;


import java.util.List;
import sist.co.model.FriendDTO;
import sist.co.model.MemberDTO;

public interface FriendService {

	public List<FriendDTO> getFriendsList(String m_id) throws Exception;
	public MemberDTO getFriendsInformation(String f_id) throws Exception;
	public List<FriendDTO> getAskFriendsList(String m_id) throws Exception;
	public List<FriendDTO> getAnsFriendsList(String m_id) throws Exception;
	//그룹별 친구관리
	public List<String> getFamilyList(String m_id) throws Exception;
	public List<String> getBestFriendsList(String m_id) throws Exception;
	public List<FriendDTO> getKnowList(String m_id) throws Exception;
	public List<String> getBlockList(String m_id) throws Exception;

	public int getFriendsTotalNumOfFriends(String m_id) throws Exception;	// 친구가 맺은 총 친구 인원수 출력
}
