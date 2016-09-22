package sist.co.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.EventDTO;
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
	public List<EventDTO> selectEventList() throws Exception {
		return eventDAO.selectEventList();
	}
}