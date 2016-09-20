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

import sist.co.model.NewsFeedDTO;
import sist.co.model.SistPDSDTO;
import sist.co.service.NewsFeedService;
import sist.co.util.FUpUtil;


@Controller
public class YSController {

   private static final Logger logger = LoggerFactory.getLogger(YSController.class);
   
   @Autowired
   NewsFeedService newsFeedService;
   
/*   
   @RequestMapping(value="ys_first.do", method=RequestMethod.GET)
   public String ys_first(Model model){
      logger.info("ys_first.do"+new Date());
      return "main.tiles";
   }*/
   
/*   @RequestMapping(value="pdswrite.do", method=RequestMethod.GET)
   public String pdswrite(Model model){      
      logger.info("PdsController pdswrite " + new Date());      
      model.addAttribute("doc_title", "자료올리기");
      
      return "pdswrite.tiles";         
   }
   */
/*   @RequestMapping(value="pdsupload.do", 
         method=RequestMethod.POST)
   public String pdsupload(SistPDSDTO pdsdto,
                     HttpServletRequest request,
                     @RequestParam(value="fileload2", required=false)
                     MultipartFile fileload, Model model){
      
      logger.info("PdsController pdsupload " + new Date());
      model.addAttribute("doc_title", "pds 업로드");
      pdsdto.setFilename(fileload.getOriginalFilename());

      
      System.out.println(pdsdto.toString());
      
      String fupload = request.getServletContext().getRealPath("/upload");
      //String fupload = "c:\\upload";   // 폴더에 올리고 싶을 때
      logger.info(": " + fupload);
      
      String f = pdsdto.getFilename();      
      String newFile = FUpUtil.getNewFile(f);      
      logger.info(fupload+ "/" + newFile);
      
      pdsdto.setFilename(newFile);
      
      try{      
         File file = new File(fupload + "/" + newFile);      
         FileUtils.writeByteArrayToFile(file, fileload.getBytes());
      
         sistPDSService.uploadPDS(pdsdto);
         logger.info("pdsupload success");
         
      }catch(IOException e){
         logger.info("pdsupload fail!");
      }
      
      return "redirect:/ys_first.do";      
   }
   */
   
   
   
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
      return "main.tiles";
   }
   
   @RequestMapping(value="NewsFeedList.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String NewsFeedList(Model model){   
      logger.info("YSController NewsFeedList " + new Date());
      List<NewsFeedDTO> NewsFeedList =  newsFeedService.getNewsFeedList();
      model.addAttribute("NewsFeedList",NewsFeedList);
   /*   System.out.println("NewsFeedList.size()=="+NewsFeedList.size());
      
      model.addAttribute("lastnum",NewsFeedList.size());*/
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
	   
	   return "newsfeed.tiles";
	   
   }
   
   
}