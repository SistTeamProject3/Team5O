package sist.co.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.model.MemberDTO;
import sist.co.model.MsgMember;
import sist.co.service.MemberService;

//

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.io.*;
import java.util.*;
import java.security.Security;

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
	
	@RequestMapping(value="main.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainAf (HttpServletRequest request, MemberDTO member, Model model) throws Exception{
		return "forward:/NewsFeedList.do";
	}
	
	
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf (HttpServletRequest request, MemberDTO member, Model model) throws Exception{
		logger.info("환영합니다 SistMemberController login" + new Date());
		
		MemberDTO login = null;
		login =  MemberService.login(member);
		
		if(login != null && !login.getM_id().equals("")){
			request.getSession().setAttribute("login", login);
			return "main.tiles";
			
		}else{
			
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value="regi.do", method=RequestMethod.GET)
	public String regi(Model model){
		logger.info("환영합니다 SistMemberController login" + new Date());
		return "regi.tiles";
	}
	
	@RequestMapping(value="regiAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regiAf(HttpServletRequest request, Model model, MemberDTO member) throws Exception{
		
		member.setM_nickname(member.getM_name());
		member.setM_profile("test");
		
		if(member.getM_highschool()==null){
			member.setM_highschool("");
		}
		if(member.getM_university()==null){
			member.setM_university("");
		}
		if(member.getM_office()==null){
			member.setM_office("");
		}
		if(member.getM_content()==null){
			member.setM_content("");
		}
		
		MemberService.add_member(member);
		return "redirect:/login.do";
	}
	
	
	
	
	
	
	@RequestMapping(value="my_page.do", method=RequestMethod.GET)
	public String mypage(Model model){
		logger.info("환영합니다 SistMemberController login" + new Date());
		return "my_page.tiles";
	}
	
	
	@RequestMapping(value="change_m_mypage.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_mypage(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		logger.info("환영합니다 SistMemberController change_m_mypage" + new Date());

		if(!member.getM_office().equals("")){
			MemberService.change_m_office(member);
		}
		else if(!member.getM_highschool().equals("")){
			MemberService.change_m_highschool(member);
		}
		else if(!member.getM_university().equals("")){
			MemberService.change_m_university(member);
		}
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);

		return login;
	}
	
	
	@RequestMapping(value="change_m_marriage.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_marriage(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		logger.info("환영합니다 SistMemberController change_m_marriage" + new Date());

		MemberService.change_m_marriage(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		
		return login;
	}

	@RequestMapping(value="change_m_content.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public MemberDTO change_m_content(HttpServletRequest request,MemberDTO member, Model model) throws Exception{
		logger.info("환영합니다 SistMemberController change_m_content" + new Date());

		MemberService.change_m_content(member);
		
		MemberDTO login = null;
		login =  MemberService.login2(member);
		
		request.getSession().setAttribute("login", login);
		
		return login;
	}
	
	
	
	
	
	
/*	@RequestMapping(value="modify_content3.do", method=RequestMethod.GET)
	public String modify_content(Model model){
		logger.info("자기소개!" + new Date());
		return "modify_content.jsp";
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="check_member.do", method=RequestMethod.POST)
	@ResponseBody
	public MsgMember check_member( HttpServletRequest request, MemberDTO member, Model model) throws Exception{

		
		logger.info("MemberController getID " + new Date());	
		
		int count= MemberService.check_member(member);
		int random = (int)(Math.random()*10000000)+10000000;
						
		MsgMember msg = new MsgMember();
		if(count > 0){
			
			msg.setMessage("Sucs");
			
					
		}else{
			
			msg.setMessage(""+(random));
			
			Properties p = new Properties();
			p.put("mail.smtp.user", "jossi8918@gmail.com"); // Google계정@gmail.com으로 설정
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable","true");
			p.put( "mail.smtp.auth", "true");
			 
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465"); 
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
			p.put("mail.smtp.socketFactory.fallback", "false");
			 
			  
			 
			try {
				Authenticator auth = new SMTPAuthenticator();
				Session session = Session.getInstance(p, auth);
				/*session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.*/	
				
				MimeMessage msg2 = new MimeMessage(session);
				String message = "["+random+"]" + " 인증번호 발송 내용입니다 다음 인증번호를 입력해주세요 .";
				msg2.setSubject("회원 인증번호 발송 내용입니다 확인 후 인증번호를 입력해주세요.");
				Address fromAddr = new InternetAddress("jossi8918@gmail.com"); // 보내는 사람의 메일주소
				msg2.setFrom(fromAddr);
				Address toAddr = new InternetAddress(member.getM_id());  // 받는 사람의 메일주소
				msg2.addRecipient(Message.RecipientType.TO, toAddr); 
				msg2.setContent(message, "text/plain;charset=UTF-8");
			   
				Transport.send(msg2);
			}
			catch (Exception mex) { // Prints all nested (chained) exceptions as well 
				mex.printStackTrace(); 
			} 
			}
		return msg;
		
	}
	
	
	
	private static class SMTPAuthenticator extends javax.mail.Authenticator {
		 
		  public PasswordAuthentication getPasswordAuthentication() {
			  return new PasswordAuthentication("jossi8918", "tjdghks89"); // Google id, pwd, 주의) @gmail.com 은 제외하세요
		  }
	}
	
	
	

	
	
}
