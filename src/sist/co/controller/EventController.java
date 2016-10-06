package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sist.co.util.CalendarUtil;
import sist.co.util.FUpUtil;
import sist.co.model.CalendarDTO;
import sist.co.model.EventDTO;
import sist.co.model.EventInviteDTO;
import sist.co.model.MemberDTO;
import sist.co.service.EventService;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	EventService eventService;
	
	@RequestMapping(value="event_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String event_calendar(Model model, HttpServletRequest request) throws Exception {
		
		logger.info("event_calendar.do 접근 " + new Date());
		
		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String yyyymm = CalendarUtil.yyyy_mm(year, month + 1);
		
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("login");
		CalendarDTO calendar = new CalendarDTO();

		calendar.setM_id(member.getM_id());
		calendar.setYyyymm(yyyymm);
		
		List<EventDTO> eventList = new ArrayList<EventDTO>();
		eventList = eventService.selectEventList(calendar);
		
		List<EventDTO> eventInviteList = new ArrayList<EventDTO>();
		eventInviteList = eventService.selectEventInviteList(calendar);
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("eventInviteList", eventInviteList);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "event_calendar.tiles";
	}
	
	@RequestMapping(value="form_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calendar_form(Model model, String year, String month, String day,
								HttpServletRequest request) throws Exception {
		
		logger.info("form_calendar.do 접근 " + new Date());
		
		String yyyymm = CalendarUtil.yyyy_mm(Integer.parseInt(year), Integer.parseInt(month) + 1);
		
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("login");
		CalendarDTO calendar = new CalendarDTO();

		calendar.setM_id(member.getM_id());
		calendar.setYyyymm(yyyymm);
		
		List<EventDTO> eventList = new ArrayList<EventDTO>();
		eventList = eventService.selectEventList(calendar);
		
		List<EventDTO> eventInviteList = new ArrayList<EventDTO>();
		eventInviteList = eventService.selectEventInviteList(calendar);
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("eventInviteList", eventInviteList);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		return "form_calendar.tiles";
	}
	
	@RequestMapping(value="event_write.do", method=RequestMethod.POST)
	public String addEvent(Model model, EventDTO event, HttpServletRequest request,
							@RequestParam(value="image_name", required=false) MultipartFile fileload) throws Exception {
		
		logger.info("event_write.do 접근 " + new Date());
		logger.info("event.toString(): " + event.toString());
	//	logger.info("fileload.getOriginalFilename(): " + fileload.getOriginalFilename());
		
		if ( event.getE_image().equals("") ) {
			event.setE_image(fileload.getOriginalFilename());
		}
			
		if ( !fileload.getOriginalFilename().equals("") ) {
			
			String fupload = request.getServletContext().getRealPath("/upload");
			
	//		logger.info("fupload: " + fupload);
			
			String f = event.getE_image();
			String newFile = FUpUtil.getNewFile(f);
			
	//		logger.info("fupload: " + "/" + newFile);
			
			event.setE_image(newFile);
			
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		}
		
		try {
			eventService.addEvent(event);
			logger.info("업로드 성공");
			
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("업로드 실패");
		}
		
		return "redirect:/event_calendar.do";
	}
	
	@RequestMapping(value="event_detail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String event_detail(Model model, HttpServletRequest request, int seq) throws Exception {
		
		logger.info("event_detail.do 접근 " + new Date());
		
		List<EventInviteDTO> eventInviteResult = eventService.selectEventInviteResult(seq);
		
		HttpSession session = request.getSession();
		session.setAttribute("eventInviteResult", eventInviteResult);
		
		return "forward:/infriendsearch.do?eventSeq=" + seq;
	}
	
	@RequestMapping(value="event_invite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String event_invite(Model model, int seq, String inviteMemberList) throws Exception {
		
		logger.info("event_invite.do 접근 " + new Date());
		
		List<EventInviteDTO> memberList2 = new ArrayList<EventInviteDTO>();
		if ( inviteMemberList.length() > 0 ) {
			
			String[] memberIdList = inviteMemberList.split("-");
			
			for ( int i = 0; i < memberIdList.length; i++ ) {
			//	logger.info("inviteList[" + i + "]: " + memberIdList[i]);
				EventInviteDTO inviteMember = new EventInviteDTO(seq, memberIdList[i], 0, null);
				memberList2.add(inviteMember);
			}
		}
		/*
		for ( int i = 0; i < memberList2.size(); i++ ) {
			logger.info("memberList[" + i + "]: " + memberList2.get(i).getM_id());
		}
		*/
		
		HashMap<String, List<EventInviteDTO>> inviteList = new HashMap<String, List<EventInviteDTO>>();
		inviteList.put("list", memberList2);
		
		eventService.insertEventInvite(inviteList);
		
		return "redirect:/event_detail.do?seq=" + seq;
	}
	
	@RequestMapping(value="update_event_invite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String event_invite(Model model, EventDTO event) throws Exception {
		
		logger.info("update_event_invite.do 접근 " + new Date());
		
		eventService.updateEventInvite(event);
		
		return "redirect:/event_detail.do?seq=" + event.getE_seq();
		
	//	return "event_detail.tiles";
	}
	
}