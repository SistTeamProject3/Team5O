package sist.co.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.model.MemberDTO;
import sist.co.model.MsgMember;
import sist.co.service.MemberService;


@Controller
public class MemBerController {

	private static final Logger logger = LoggerFactory.getLogger(MemBerController.class);
	
	@Autowired
	MemberService MemberService;
	
	
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
	
	
	@RequestMapping(value="check_member.do", method=RequestMethod.POST)
	@ResponseBody
	public MsgMember check_member( HttpServletRequest request, MemberDTO member, Model model) throws Exception{

		
		logger.info("MemberController getID " + new Date());	
		
		int count= MemberService.check_member(member);
		int random = (int)(Math.random()*10000000)+10000000;
		System.out.println("random = "+random);
		
		request.getSession().setAttribute("random", random);
		/*model.addAttribute("random",random);*/
		MsgMember msg = new MsgMember();
		if(count > 0){
			
			msg.setMessage("Sucs");
			
					
		}else{
			
			msg.setMessage("Fail");
			System.out.println("들어옴???");
			System.out.println("들어옴???");
			System.out.println("들어옴???");
			
		}
		return msg;
		
	}
	
}
