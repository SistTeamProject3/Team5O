package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sist.co.util.FUpUtil;
import sist.co.model.EventDTO;
import sist.co.model.MsgEvent;
import sist.co.service.EventService;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	EventService eventService;
	
	@RequestMapping(value="event_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String event_calendar() throws Exception {
		
		logger.info("event_calendar.do 접근 " + new Date());
		
		return "event_calendar.tiles";
	}
	
	@RequestMapping(value="form_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calendar_form(Model model, String year, String month, String day) throws Exception {
		
		logger.info("form_calendar.do 접근 " + new Date());
		
		model.addAttribute("year", year);
		model.addAttribute("year", month);
		model.addAttribute("year", day);
		
		return "form_calendar.tiles";
	}
	
	@RequestMapping(value="event_write.do", method=RequestMethod.POST)
	public String addEvent(Model model, EventDTO event, HttpServletRequest request,
							@RequestParam(value="image_name", required=false) MultipartFile fileload) throws Exception {
		
		logger.info("event_write.do 접근 " + new Date());
		logger.info("event.toString(): " + event.toString());
		logger.info("fileload.getOriginalFilename(): " + fileload.getOriginalFilename());
		
		if ( event.getE_image().equals("") ) {
			event.setE_image(fileload.getOriginalFilename());
		}
			
		if ( !fileload.getOriginalFilename().equals("") ) {
			
			String fupload = request.getServletContext().getRealPath("/upload");
			
			logger.info("fupload: " + fupload);
			
			String f = event.getE_image();
			String newFile = FUpUtil.getNewFile(f);
			
			logger.info("fupload: " + "/" + newFile);
			
			event.setE_image(newFile);
			
			File file = new File(fupload + "/" + newFile);
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		}
		
		try {
			eventService.addEvent(event);
			
			logger.info("업로드 성공");
			
		} catch (IOException e) {
			logger.info("업로드 실패");
		}
		
		return "redirect:/event_calendar.do";
	}
}