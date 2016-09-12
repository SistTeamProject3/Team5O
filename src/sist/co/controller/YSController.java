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

import sist.co.model.NewsFeedDTO;
import sist.co.model.SistPDSDTO;
import sist.co.service.NewsFeedService;
import sist.co.util.FUpUtil;


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
	
		logger.info("YSController writeNewsFeed " + new Date());
		System.out.println(newsfeeddto.toString());
		if(fileload!=null){
			System.out.println(" 야호 null이 아니다");
		System.out.println("fileload.getSize()=="+fileload.getSize());
		}
		else{
			System.out.println("null이다");
			System.out.println("null이다");
			System.out.println("null이다");
			System.out.println("null이다");
			System.out.println("null이다");
		}

		newsfeeddto.setFilename(fileload.getOriginalFilename());

		System.out.println(newsfeeddto.toString());
		String fupload = request.getServletContext().getRealPath("/upload");
		//String fupload = "c:\\upload";	
		logger.info(": " + fupload);
		
		String f = newsfeeddto.getFilename();		
		String newFile = FUpUtil.getNewFile(f);		
		logger.info(fupload+ "/" + newFile);
		
		if(newsfeeddto.getTag_feel()==null){
			newsfeeddto.setTag_feel("");
		}
		
		newsfeeddto.setFilename(newFile);
		System.out.println("newFile==="+newFile);
		System.out.println("newFile==="+newFile);
		System.out.println("newFile==="+newFile);
		System.out.println("newFile==="+newFile);
		
		
		if(fileload.getSize()==0){
			try{		
				File file = new File(fupload + "/" + newFile);		
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	
				newsFeedService.writeNewsFeed(newsfeeddto);
			
				logger.info("writeNewsFeed success");
				
			}catch(IOException e){
	
				logger.info("writeNewsFeed fail!");
			}
			
		}else{
			try{		
				File file = new File(fupload + "/" + newFile);		
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	
				newsFeedService.writeNewsFeedImage(newsfeeddto);
			
				logger.info("writeNewsFeed success");
				
			}catch(IOException e){
	
				logger.info("writeNewsFeed fail!");
			}
		}
		
		return "redirect:/ys_first.do";		
	}

	
}
