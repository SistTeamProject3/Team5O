package sist.co.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemBerController {

	private static final Logger logger = LoggerFactory.getLogger(MemBerController.class);
	
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login(Model model){
		logger.info("환영합니다 SistMemberController login" + new Date());
		return "login.tiles";
	}
	@RequestMapping(value="loginAf.do", method=RequestMethod.GET)
	public String loginAf(Model model){
		logger.info("환영합니다 SistMemberController login" + new Date());
		return "main.tiles";
	}
	@RequestMapping(value="regi.do", method=RequestMethod.GET)
	public String regi(Model model){
		logger.info("환영합니다 SistMemberController login" + new Date());
		return "regi.tiles";
	}
	
	
}
