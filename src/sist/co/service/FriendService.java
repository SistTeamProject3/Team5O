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
	//친구 외 검색
	public List<MemberDTO> searchsomeone(MemberDTO memberdto) throws Exception;
	//친구맺기(친구 요청 보내기)
	public boolean befriend(FriendDTO friendDTO) throws Exception;
	//친구 요청 수락(받은 친구요청)
	public boolean accept(FriendDTO friendDTO) throws Exception;
	//친구 요청 거절(받은 친구요청)
	public boolean refuse(FriendDTO friendDTO) throws Exception;
	//친구요청 취소 (보낸 친구요청) & 차단 풀기
	public boolean cancle(FriendDTO friendDTO) throws Exception;
	//친구 끊기
	public boolean stranger(FriendDTO friendDTO) throws Exception;
	//차단 하기
	public boolean block(FriendDTO friendDTO) throws Exception;
	
}
