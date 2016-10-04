package sist.co.service;

import java.util.HashMap;
import java.util.List;

import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;

public interface EventService {

	void addEvent(EventDTO event) throws Exception;
	List<EventDTO> selectEventList(String yyyymm) throws Exception;
	EventDTO selectEventDetail(int seq) throws Exception;
	EventDTO selectEventInvite(EventDTO event) throws Exception;
	void insertEventInvite(HashMap<String, List<EventInviteDTO>> inviteList) throws Exception;
	boolean updateEventInvite(EventDTO event) throws Exception;
}