package sist.co.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@RequestMapping(value="event_calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String event_calendar() throws Exception {
		
		logger.info("event_calendar.do 접근 " + new Date());
		
		return "event_calendar.tiles";
	}
	
	@RequestMapping(value="calendar_form.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calendar_form(Model model, String year, String month, String day) throws Exception {
		
		logger.info("calendar_form.do 접근 " + new Date());
		
		model.addAttribute("year", year);
		model.addAttribute("year", month);
		model.addAttribute("year", day);
		
		return "calendar_form.tiles";
	}
}