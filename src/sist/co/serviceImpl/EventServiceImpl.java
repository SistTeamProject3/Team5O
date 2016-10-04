package sist.co.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;
import sist.co.service.EventDAO;
import sist.co.service.EventService;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;
	
	@Override
	public void addEvent(EventDTO event) throws Exception {
		eventDAO.addEvent(event);
	}

	@Override
	public List<EventDTO> selectEventList(String yyyymm) throws Exception {
		return eventDAO.selectEventList(yyyymm);
	}

	@Override
	public EventDTO selectEventDetail(int seq) throws Exception {
		return eventDAO.selectEventDetail(seq);
	}

	@Override
	public EventDTO selectEventInvite(EventDTO event) throws Exception {
		return eventDAO.selectEventInvite(event);
	}

	@Override
	public void insertEventInvite(HashMap<String, List<EventInviteDTO>> inviteList) throws Exception {
		eventDAO.insertEventInvite(inviteList);
	}

	@Override
	public boolean updateEventInvite(EventDTO event) throws Exception {
		return eventDAO.updateEventInvite(event);
	}
}