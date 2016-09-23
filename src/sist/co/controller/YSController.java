package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

import sist.co.model.MemberDTO;
import sist.co.model.NewsFeedDTO;
import sist.co.model.SistPDSDTO;

import sist.co.service.NewsFeedService;
import sist.co.util.FUpUtil;

import sist.co.service.MemberService;


@Controller
public class YSController {


   private static final Logger logger = LoggerFactory.getLogger(YSController.class);
   
   @Autowired
   NewsFeedService newsFeedService;
   
   @Autowired
   MemberService MemberService;

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
      
      if(newsfeeddto.getN_tag_feel()==null){
         newsfeeddto.setN_tag_feel("");
      }
      
      newsfeeddto.setFilename(newFile);
      System.out.println("newFile==="+newFile);
      System.out.println("newFile==="+newFile);
      System.out.println("newFile==="+newFile);
      System.out.println("newFile==="+newFile);
      
      System.out.println("getSize"+fileload.getSize());
      if(fileload.getSize()==0){
         try{      
        	 
        	 System.out.println("getSize==0");
        	 System.out.println("getSize==0");
        	 System.out.println("getSize==0");
        	 
            File file = new File(fupload + "/" + newFile);      
            FileUtils.writeByteArrayToFile(file, fileload.getBytes());
   
            newsFeedService.writeNewsFeed(newsfeeddto);
            System.out.println("여기"+newsfeeddto.toString());
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
      if ( newsfeeddto.getG_seq() != 0 ) {
    	  logger.info("조건이 들어감");
    	 
    	  return "redirect:/group_detail.do?g_seq="+newsfeeddto.getG_seq();
      }else {
    	  return "redirect:/NewsFeedList2.do";  
      }
   }
   
   
   
   @RequestMapping(value="NewsFeedList.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String NewsFeedList(HttpServletRequest request, MemberDTO member, Model model) throws Exception{   
      
      logger.info("YSController NewsFeedList " + new Date());
      
      
      MemberDTO login = null;
      login =  MemberService.login(member);
      
      if(login != null && !login.getM_id().equals("")){
          
         List<NewsFeedDTO> NewsFeedList =  newsFeedService.getNewsFeedList();
         model.addAttribute("NewsFeedList",NewsFeedList);
            
            request.getSession().setAttribute("login", login);
         return "main.tiles";
         
      }else{
         
         return "redirect:/login.do";
      }
      
  }   
   
   @RequestMapping(value="NewsFeedList2.do", 
            method={RequestMethod.GET, RequestMethod.POST})
      public String NewsFeedList2(HttpServletRequest request, MemberDTO member, Model model) throws Exception{   
         
         logger.info("YSController NewsFeedList " + new Date());

            List<NewsFeedDTO> NewsFeedList =  newsFeedService.getNewsFeedList();
            model.addAttribute("NewsFeedList",NewsFeedList);

            return "main.tiles";

     }   
   
   
   @RequestMapping(value="test.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String test(Model model, int lastseq){   
      logger.info("YSController test" + new Date());
      model.addAttribute("lastseq",lastseq);
      return "redirect:/test2.do";
   }
   
   
   @RequestMapping(value="test2.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String test2(Model model, int lastseq){   
      logger.info("YSController test2" + new Date());
      NewsFeedDTO dto  =  newsFeedService.addPrintNewsFeed(lastseq);
      
      if(dto==null){
         System.out.println("null이다");
         
      }else{
         model.addAttribute("news",dto);
         System.out.println(dto.toString());
      }
      return "newsfeed.tiles";
   }
   
   
   @RequestMapping(value="updateShow.do", 
            method={RequestMethod.GET, RequestMethod.POST})
      public String updateShow(Model model, String val){ 
      logger.info("YSController updateShow" + new Date());
      
      System.out.println("val=="+val);
      String[] arr = val.split(",");
      
      int updatenum=Integer.parseInt(arr[0]);
      int seq=Integer.parseInt(arr[1]);
      
      
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      map.put("updatenum",updatenum);
      map.put("seq",seq);
      
      System.out.println("map.size()==="+map.size());
      newsFeedService.updateShow(map);
      
      return "redirect:/NewsFeedList2.do";
      
   }
   
   
   @RequestMapping(value="deleteNews.do", 
            method={RequestMethod.GET, RequestMethod.POST})
      public String removeNews(Model model, String val){ 
      logger.info("YSController deleteNews" + new Date());
      
      System.out.println("val=="+val);
      
      newsFeedService.deleteNews(Integer.parseInt(val));
      
      return "redirect:/NewsFeedList2.do";
      
 }
   
   
   

   
   
}


