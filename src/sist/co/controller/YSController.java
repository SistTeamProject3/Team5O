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
import org.springframework.web.multipart.MultipartFile;

import sist.co.help.FUpUtil;
import sist.co.model.NewsFeedDTO;
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
	
	@RequestMapping(value="writeNewsFeed.do", 
			method=RequestMethod.POST)
	public String writeNewsFeed(NewsFeedDTO newsfeeddto,
							HttpServletRequest request,
							@RequestParam(value="fileload", required=false)
							MultipartFile fileload, Model model){
		
		logger.info("PdsController pdsupload " + new Date());
		newsfeeddto.setFilename(fileload.getOriginalFilename());

		String fupload = request.getServletContext().getRealPath("/upload");
		//String fupload = "c:\\upload";	
		logger.info(": " + fupload);
		
		String f = newsfeeddto.getFilename();		
		String newFile = FUpUtil.getNewFile(f);		
		logger.info(fupload+ "/" + newFile);
		
		newsfeeddto.setFilename(newFile);
		
		try{		
			File file = new File(fupload + "/" + newFile);		
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		
			newsFeedService.writeNewsFeed(newsfeeddto);
			logger.info("writeNewsFeed success");
			
		}catch(IOException e){
			logger.info("writeNewsFeed fail!");
		}
		
		return "redirect:/ys_first.do";		
	}
	
	
	
	
}
