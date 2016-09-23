package sist.co.service;

import java.util.List;

import sist.co.model.EventDTO;

public interface EventService {

	void addEvent(EventDTO event) throws Exception;
	List<EventDTO> selectEventList(String yyyymm) throws Exception;
}