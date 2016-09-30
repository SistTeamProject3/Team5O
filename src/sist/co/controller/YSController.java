package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import sist.co.model.EventDTO;
import sist.co.model.MemberDTO;
import sist.co.model.NewsFeedDTO;
import sist.co.model.NewsFeedLikeDTO;
import sist.co.model.NewsFeedListDTO;
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

   @RequestMapping(value="writeNewsFeed.do", method=RequestMethod.POST)
   public String writeNewsFeed(NewsFeedDTO newsfeeddto,
                     HttpServletRequest request,
                     Model model,
                     @RequestParam(value="fileloadd", required=false) MultipartFile fileload,
                     @RequestParam (value = "viewPage", defaultValue = "") String link,
                     @RequestParam (value = "n_event_seq", defaultValue = "0") int eventSeq
                     ){
	   
    	   logger.info("YSController writeNewsFeed " + new Date());
		System.out.println(newsfeeddto.toString());

		if (fileload != null) {
			System.out.println(" 야호 null이 아니다");
			System.out.println("fileload.getSize()==" + fileload.getSize());
			System.out.println("fileload.getSize()==" + fileload.getSize());
			System.out.println("fileload.getSize()==" + fileload.getSize());
		} else {
			System.out.println("null이다");
			System.out.println("null이다");
			System.out.println("null이다");
			System.out.println("null이다");
			System.out.println("null이다");
		}

		newsfeeddto.setFilename(fileload.getOriginalFilename());

		System.out.println(newsfeeddto.toString());
		String fupload = request.getServletContext().getRealPath("/upload");
		// String fupload = "c:\\upload";
		logger.info(": " + fupload);

		String f = newsfeeddto.getFilename();
		String newFile = FUpUtil.getNewFile(f);
		logger.info(fupload + "/" + newFile);

		if (newsfeeddto.getN_tag_feel() == null) {
			newsfeeddto.setN_tag_feel("");
		}

		newsfeeddto.setFilename(newFile);
		System.out.println("newFile===" + newFile);
		System.out.println("newFile===" + newFile);
		System.out.println("newFile===" + newFile);
		System.out.println("newFile===" + newFile);

		System.out.println("getSize" + fileload.getSize());
		if (fileload.getSize() == 0) {
			try {
				File file = new File(fupload + "/" + newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				System.out.println("여기" + newsfeeddto.toString());
				newsFeedService.writeNewsFeed(newsfeeddto);

				logger.info("writeNewsFeed success");

			} catch (IOException e) {

				logger.info("writeNewsFeed fail!");
			}

		} else {
			try {

				File file = new File(fupload + "/" + newFile);
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				newsFeedService.writeNewsFeedImage(newsfeeddto);

				logger.info("writeNewsFeed success");

			} catch (IOException e) {

				logger.info("writeNewsFeed fail!");
			}
		}
		
	return "forward:/NewsFeedList2.do?link=" + link + "&eventSeq=" + eventSeq;  
    
      /*
      if ( newsfeeddto.getG_seq() != 0 ) {
    	  logger.info("조건이 들어감");
    	 
    	  return "redirect:/group_detail.do?g_seq="+newsfeeddto.getG_seq();
      }else {
    	  return "redirect:/NewsFeedList2.do?link=" + link + "&eventSeq=" + eventSeq;  
      }
      */
   }
   
	@RequestMapping(value = "NewsFeedList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String NewsFeedList(HttpServletRequest request, MemberDTO member, Model model) throws Exception {

		logger.info("YSController NewsFeedList " + new Date());

		MemberDTO login = null;

		login = MemberService.login(member);

		if (login != null && !login.getM_id().equals("")) {

			NewsFeedListDTO newsfeedlistDTO = new NewsFeedListDTO("main", null, 0);
			List<NewsFeedDTO> NewsFeedList = newsFeedService.getNewsFeedList(newsfeedlistDTO);

			for (int i = 0; i < NewsFeedList.size(); i++) {
				if (NewsFeedList.get(i).getN_form_num() == 1) {
					String fname = newsFeedService.getImageFile((NewsFeedList.get(i).getN_seq()));
					NewsFeedList.get(i).setFilename(fname);
				}
			}
			
			model.addAttribute("NewsFeedList", NewsFeedList);
			request.getSession().setAttribute("login", login);
			return "main.tiles";

		} else {

			return "redirect:/login.do";
		}

	}
	
    /*
	 * 공동 작업자: 김명호
	 * param: link(이벤트 페이지에서 넘너옴)
	 */
	@RequestMapping(value = "NewsFeedList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String NewsFeedList2(HttpServletRequest request, MemberDTO member, Model model,
			@RequestParam (value = "link", defaultValue = "") String link,
			@RequestParam (value = "eventSeq", defaultValue = "0") int eventSeq) throws Exception {
	
		logger.info("YSController NewsFeedList2 " + new Date());
		
		logger.info("link: " + link + ", eventSeq: " + eventSeq);
	
		NewsFeedListDTO newsfeedlistDTO = null;
		
		// 공동 작업
		if ( link.equals("main") ) 			newsfeedlistDTO = new NewsFeedListDTO("main", null, 0);
		else if ( link.equals("people") ) 	newsfeedlistDTO = new NewsFeedListDTO("people", member.getM_id(), 0);
		else if ( link.equals("event") )	newsfeedlistDTO = new NewsFeedListDTO("event", null, eventSeq);
		
		List<NewsFeedDTO> NewsFeedList = newsFeedService.getNewsFeedList(newsfeedlistDTO);
		for (int i = 0; i < NewsFeedList.size(); i++) {
			if (NewsFeedList.get(i).getN_form_num() == 1) {
				String fname = newsFeedService.getImageFile((NewsFeedList.get(i).getN_seq()));
				NewsFeedList.get(i).setFilename(fname);
			}
		}
	
		model.addAttribute("NewsFeedList", NewsFeedList);
		
		if ( link.equals("event") ) {
			HttpSession session = request.getSession();
			model.addAttribute("event", session.getAttribute("event"));
			model.addAttribute("finformlist", session.getAttribute("finformlist"));
			model.addAttribute("imgpath", session.getAttribute("imgpath"));
			
			return "event_detail.tiles";
		}
	
		return "main.tiles";
}   
   
   
/*   @RequestMapping(value="test.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String test(Model model, int lastseq){   
	 
      logger.info("YSController test" + new Date());
      model.addAttribute("lastseq",lastseq);
      return "redirect:/test2.do";
   }*/
   
   
   @RequestMapping(value="test2.do", 
         method={RequestMethod.GET, RequestMethod.POST})
   public String test2(Model model, int lastseq){   
      logger.info("YSController test2" + new Date());
      List<NewsFeedDTO> list  =  newsFeedService.addPrintNewsFeed(lastseq);
      
      if(list.size()==0){
         System.out.println("null이다");
         
      }else{
         model.addAttribute("NewsFeedList",list);
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
   
   
   @RequestMapping(value="Like.do", 
	         method={RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
	   public List<String> Like(Model model, int seq, String m_id){
	   logger.info("YSController LikeLikeLikeLikeLike" + new Date());
	   
	   NewsFeedLikeDTO dto = new NewsFeedLikeDTO(seq,m_id);
	   if(newsFeedService.getLikeListCount(dto)==1){
		   newsFeedService.deleteLike(dto);
	   }else{
		   newsFeedService.insertLike(dto);
	   }	   
	   List<String> list = newsFeedService.getLikeList(seq);

	   return list;
   }
   
   
   @RequestMapping(value="writeComment.do", 
           method={RequestMethod.GET, RequestMethod.POST})
     public String writeComment(Model model,NewsFeedDTO newsfeeddto,
    		 					@RequestParam (value = "viewPage", defaultValue = "") String link,
    		 					@RequestParam (value = "eventSeq", defaultValue = "0") int eventSeq){ 
	      logger.info("YSController writeComment " + new Date());

	      System.out.println(newsfeeddto.toString());
	      newsFeedService.insertComment(newsfeeddto);
	      
	      return "redirect:/NewsFeedList2.do?link=" + link + "&eventSeq=" + eventSeq;
	   }

}


