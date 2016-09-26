package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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

import sist.co.util.FUpUtil;
import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.model.GroupPhotoDTO;
import sist.co.model.GroupRequestDTO;
import sist.co.model.MemberDTO;
import sist.co.model.NewsFeedDTO;
import sist.co.model.VoteDTO;
import sist.co.model.VotelistDTO;
import sist.co.service.GroupService;
import sist.co.service.NewsFeedService;

@Controller
public class GroupController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
		
	@Autowired
	private GroupService groupService;
	private NewsFeedService newsFeedService;
	private MemberDTO memDTO;
	
	// 그룹 만들기
	@RequestMapping(value = "group_make.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_make(Model model, GroupMakeDTO group) throws Exception {
		logger.info(" group_make " + new Date());
		// 그룹 만들기
		groupService.group_make(group);
		// 만든 그룹으로 가기 위해 작성
		GroupMakeDTO Mdto = groupService.select_make_group(group);
		logger.info("멤버 Mdto  " + Mdto.getG_manager());
		
		// 그룹에 멤버 넣기
		GroupMemberDTO member = new GroupMemberDTO();
		member.setM_id(Mdto.getG_manager());
		member.setG_seq(Mdto.getG_seq());
		member.setG_auth(3);
		
		groupService.add_group_manager(member);
		// 멤버 들어가는 것 확인
		model.addAttribute("Mdto", Mdto);

		return "redirect:/group_detail.do?g_seq="+Mdto.getG_seq();
	}
	// 그룹 리스트 출력
	@RequestMapping(value = "group_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_list(Model model, GroupListDTO gdto, String category) throws Exception {
		logger.info(" group_list " + new Date());
		
		if (category.equals("membership")) {
			
			List<GroupListDTO> g_list = new ArrayList<GroupListDTO>();
			
			g_list = groupService.group_list(gdto);

			model.addAttribute("g_list", g_list);

			return "group_list.tiles";
		}else if (category.equals("top")) {
			
			List<GroupMakeDTO> re_list = new ArrayList<GroupMakeDTO>();
			re_list = groupService.recommend_group_list(gdto);

			model.addAttribute("re_list", re_list);
			
			model.addAttribute("s_num", gdto.getS_num());
			model.addAttribute("l_num", gdto.getL_num());

			return "recommend_group_list.tiles";
		}else {

			return "recommend_group_list.tiles";
		}
		
	}
	@RequestMapping(value = "list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model, GroupListDTO gdto, String category) throws Exception {
		logger.info("list " + new Date());
		
		List<GroupMakeDTO> re_list = new ArrayList<GroupMakeDTO>();
		re_list = groupService.recommend_group_list(gdto);
	
		model.addAttribute("re_list", re_list);
		return "list.tiles";
		
	}
	
	
	@RequestMapping(value = "group_detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail " + new Date());
		logger.info(gmake.toString() +"투스트링");
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}
		
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail.tiles";
	}

	// 여기부터  멤버
	
	@RequestMapping(value = "group_detail_member.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_member(Model model, GroupMakeDTO gmake, int type,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_member " + new Date());
		memDTO =(MemberDTO)request.getSession().getAttribute("login");
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		logger.info("메이크 " + gmake.toString());
		
		List<GroupMemberListDTO> g_m_list = groupService.group_mem_list(gmake);
	
		for (int i = 0; i < g_m_list.size(); i++) {
			System.out.println("멤버리스트"+g_m_list.toString());
		}
		model.addAttribute("g_m_list", g_m_list);
		
		List<GroupMemberListDTO> g_m_a_list = groupService.group_mem_admin_list(gmake);
		model.addAttribute("g_m_a_list", g_m_a_list);
		
		List<GroupMemberListDTO> g_m_r_list = groupService.group_mem_reply_list(gmake);
		model.addAttribute("g_m_r_list", g_m_r_list);
		
		List<GroupMemberListDTO> g_m_b_list = groupService.group_mem_block_list(gmake);
		model.addAttribute("g_m_b_list", g_m_b_list);
		
		if (type == 1) {
			return "group_detail_member.tiles";
		}else if (type == 2) {
			return "group_detail_member_admin.tiles";
		}else {
			return "group_detail_member_block.tiles";
		}
	}
	

	// 여기까지 멤버

	@RequestMapping(value = "group_detail_event.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_event(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_event " + new Date());
	
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_event.tiles";
	}

	// 여기부터 사진
	@RequestMapping(value = "group_detail_photo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_photo(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_photo " + new Date());
		
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_photolist = groupService.group_photo(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_photolist", g_photolist);
		
		
		
		return "group_detail_photo.tiles";
	}
	
	@RequestMapping(value = "group_detail_photo_video.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_photo_video(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_photo_video " + new Date());

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_videolist = groupService.group_video(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_videolist", g_videolist);
		
		return "group_detail_photo_video.tiles";
	}
	// 여기까지 사진
	// 파일
	@RequestMapping(value="group_detail_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_flie(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_flie " + new Date());

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_flist = groupService.filelist(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_flist", g_flist);
		
		
		return "group_detail_flie.tiles";
	}
	@RequestMapping(value="group_detail_upload_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_upload_flie(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_upload_flie " + new Date());

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupPhotoDTO> g_flist = groupService.filelist(gmake);
		model.addAttribute("g_make", g_make);
		model.addAttribute("g_flist", g_flist);
		
		return "group_detail_upload_flie.tiles";
	}
	@RequestMapping(value="group_detail_share_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_share_flie(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_share_flie " + new Date());

		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_share_flie.tiles";
	}
	//그룹 사진 등록
	
	@RequestMapping(value="group_main_image.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_main_image(Model model,GroupMakeDTO gmake,HttpServletRequest request,@RequestParam(value="fileload",required=false)
    MultipartFile fileload ) throws Exception {
		logger.info("group_main_image 메인이미지 " + new Date());
	
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		 gmake.setG_photo(fileload.getOriginalFilename());
		 String fupload= request.getServletContext().getRealPath("/upload");

		   String f = gmake.getG_photo();
	       String newFile = FUpUtil.getNewFile(f);
	       logger.info(fupload+"/"+newFile);
	       
	       gmake.setG_photo(newFile);
		
	       try{
	    	   File file = new File(fupload+"/"+newFile);
	    	   FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	    	   
	    	   groupService.groupimageUpload(gmake);
	    	   
	    	   logger.info("pdsupload success");
	        }catch(IOException e){
	        	   logger.info("pdsupload fail!");
	        }
	        return "redirect:/group_detail.do?g_seq="+gmake.getG_seq();
		
	}
	

	@RequestMapping(value="make_vote.do", method= { RequestMethod.GET, RequestMethod.POST })
	public String make_vote(Model model,VoteDTO vote)throws Exception{
		
		logger.info("투표!!!!!!!!!!!하기싫어!!!!!!!!!!!!!!!!아!!!!!!!!!앜!!!");
		
		
		vote.setN_content(vote.getQ_content());
		if (vote.getVote3() == null) {
			vote.setVote3("");
		}
		if (vote.getVote4() == null) {
			vote.setVote4("");
		}
		if (vote.getVote5() == null) {
			vote.setVote5("");
		}
		if (vote.getVote6() == null) {
			vote.setVote6("");
		}
		if (vote.getVote7() == null) {
			vote.setVote7("");
		}
		if (vote.getVote8() == null) {
			vote.setVote8("");
		}
		if (vote.getVote9() == null) {
			vote.setVote9("");
		}
		if (vote.getVote10() == null) {
			vote.setVote10("");
		}
		groupService.make_vote(vote);
		
		VoteDTO vdto = groupService.select_make_vote(vote);
		//
		VotelistDTO vlistdto;
		if (!vote.getVote1().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote1());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote2().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote2());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote3().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote3());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote4().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote4());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote5().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote5());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote6().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote6());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote7().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote7());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote8().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote8());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote9().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote9());
			groupService.add_vote(vlistdto);
		}
		if (!vote.getVote10().equals("")) {
			vlistdto = new VotelistDTO(vdto.getN_vote_seq(),vdto.getVote10());
			groupService.add_vote(vlistdto);
		}
	//여기서 던진다
		groupService.add_newsfeed(vdto);
	 return "redirect:/group_detail.do?g_seq="+vote.getG_seq();
	}
	//파일 다운로드
    @RequestMapping(value="fileDownload.do",method={RequestMethod.GET, RequestMethod.POST})
	public String download(HttpServletRequest request, String filename, Model model) throws Exception{
		logger.info("그룹 fileDownload " + new Date());
		
		String fupload = request.getServletContext().getRealPath("/upload");
		// String fupload = "c:\\upload\\";		// 폴더
		
		File downloadFile = new File(fupload + "/" + filename);
		
		model.addAttribute("downloadFile", downloadFile);
		
		return "downloadView";
	}
	// 가입요청
    @RequestMapping(value="group_join_request.do",method={RequestMethod.GET,RequestMethod.POST })
	@ResponseBody
    public String group_join_request(Model model, GroupRequestDTO rdto)throws Exception{
    	logger.info("group_join_request 입니다 : " + rdto.toString());
    
    	 List<GroupMemberDTO> gdto = groupService.join_search(rdto);
    	
    	 logger.info("사이즈? "+gdto.size());
    	
    	if (gdto.size() == 0) {
    		logger.info("가입되어있지않음..");
    		List<GroupRequestDTO> r_list = groupService.join_requset_search(rdto);
    		logger.info("요청한 사이즈? "+r_list.size());
    		if (r_list.size() == 0) {
    			logger.info("신청중..");
        		groupService.group_join_request(rdto);
        		logger.info("신청함");
        		return  "sucess";
			} else {
				logger.info("신청목록 확인됨");
				return  "already";
			}
		} else {
	    	logger.info("이미 요청");
	    	return  "fail";
		}
    	
    }
    
	@RequestMapping(value = "group_detail_request.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_request(Model model, GroupMakeDTO gmake,HttpServletRequest request) throws Exception {
		logger.info(" group_detail_request " + new Date());
	
		//가입 유무 확인
		GroupMemberDTO g_memdto= new GroupMemberDTO(gmake.getG_seq(), memDTO.getM_id(),0 );
		
		List<GroupMemberDTO> gm_list= groupService.select_mem(g_memdto);

		if (gm_list.size() >=1) {
			model.addAttribute("g_key", "true");
		} else {
			model.addAttribute("g_key", "false");
		}	
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		List<GroupRequestDTO> requset_list = groupService.requset_list(gmake);
		logger.info("요청 사이즈"+requset_list.size());
		
		for (int i = 0; i < requset_list.size(); i++) {
			logger.info("요청 사이즈"+requset_list.toString());
		}
		
		model.addAttribute("g_make", g_make);
		model.addAttribute("requset_list", requset_list);
		
		
		return "group_detail_request.tiles";
	}
    
	@RequestMapping(value = "group_accept.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String group_accept(Model model,GroupRequestDTO gdto,int a_type) throws Exception {
		logger.info(" group_accept " + new Date());
		logger.info(" group_accept " +	gdto.toString());
		if (a_type == 0) {
			logger.info(" 승인 타입 : " + a_type );
			boolean yes =  groupService.accept_group(gdto);
				if (yes) {
					logger.info(" 변경함 " );
					boolean yes2 = groupService.add_group_member(gdto);
					if (yes2) {
						return "ture";
					} else {
						return "fail";
					}
				}else {
					return "fail";
				}
			
		} else {
			logger.info(" 비승인  타입 : " + a_type );
			boolean yes = groupService.no_accept_group(gdto);
			if (yes) {
				logger.info(" 변경함 " );
				return "ture";
			}else {
				return "fail";
			}
		}
		
	}
	@RequestMapping(value = "group_out.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_out(Model model,GroupMemberDTO gdto) throws Exception {
		logger.info(" group_out " + new Date());
		logger.info(" 삭제할 것 " + gdto.toString());
		
		groupService.out_groupjoin(gdto);
		groupService.out_groupmember(gdto);
		
		return "redirect:/group_detail.do?g_seq="+gdto.getG_seq();
	}
	@RequestMapping(value = "group_mem_out.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String group_mem_out(Model model,GroupMemberDTO gdto) throws Exception {
		logger.info(" group_mem_out " + new Date());
		logger.info(" 삭제할 것 " + gdto.toString());
		groupService.out_groupjoin(gdto);
		groupService.out_groupmember(gdto);
		
		return "true";
	}
	
	 @RequestMapping(value="group_writeNewsFeed.do", method=RequestMethod.POST)
	  public String writeNewsFeed(NewsFeedDTO newsfeeddto, HttpServletRequest request,@RequestParam(value="fileload", required=false) MultipartFile fileload, Model model){
	      logger.info("YSController writeNewsFeed " + new Date());
	      logger.info("YSController writeNewsFeed " + newsfeeddto.toString());
	      if(fileload!= null){
	    	  logger.info("null 이 아님 ");
	    	  logger.info("파일명 "+fileload.getOriginalFilename());
	      }
	      else{
	         System.out.println("null이다");
	      }
	      newsfeeddto.setFilename(fileload.getOriginalFilename());

	      logger.info("두번쨰 " + newsfeeddto.toString());
	      String fupload = request.getServletContext().getRealPath("/upload");
	      //String fupload = "c:\\upload";   
	      logger.info(": " + fupload);
	      String f = newsfeeddto.getFilename();      
	      String newFile = FUpUtil.getNewFile(f);      
	      logger.info(fupload+ "/" + newFile);
	      
	      if(newsfeeddto.getN_tag_feel() == null){
	    	  logger.info("널이야 병신아");
	         newsfeeddto.setN_tag_feel("");
	      }
	      newsfeeddto.setFilename(newFile);
	      logger.info("newFile="+newFile);
	      logger.info("getSize"+fileload.getSize());
	      if(fileload.getSize()==0){
	         try{      
	        	logger.info("사이즈 0");
	            File file = new File(fupload + "/" + newFile);      
	            FileUtils.writeByteArrayToFile(file, fileload.getBytes());
	            // 여기서 널값 문제
	            logger.info("세번쨰 " + newsfeeddto.toString());
	            newsFeedService.writeNewsFeed(newsfeeddto);
	            logger.info("여기"+newsfeeddto.toString());
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
	    
	      return "redirect:/group_detail.do?g_seq="+newsfeeddto.getG_seq();
	   }
}
