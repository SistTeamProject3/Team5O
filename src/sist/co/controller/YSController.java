package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sist.co.service.NewsFeedService;


@Controller
public class YSController {

	private static final Logger logger = LoggerFactory.getLogger(YSController.class);
	
	@Autowired
	NewsFeedService newsFeedService;
	
	
	@RequestMapping(value="ys_first.do", method=RequestMethod.GET)
	public String ys_first(Model model){
		logger.info("ys_first.do"+new Date());
		return "main.tiles";
	}
	
	
}
