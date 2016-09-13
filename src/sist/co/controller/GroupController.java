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
import org.springframework.web.multipart.MultipartFile;

import sist.co.util.FUpUtil;
import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.service.GroupService;

@Controller
public class GroupController {

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	@Autowired
	private GroupService groupService;
	// 그룹 만들기
	@RequestMapping(value = "group_make.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_make(Model model, GroupMakeDTO group) throws Exception {
		logger.info("CalendarController group_make " + new Date());
		// 그룹 만들기
		groupService.group_make(group);
		// 만든 그룹으로 가기 위해 작성
		GroupMakeDTO Mdto = groupService.select_make_group(group);

		// 그룹에 멤버 넣기
		GroupMemberDTO member = new GroupMemberDTO(Mdto.getG_seq(), Mdto.getG_manager(), 3);

		groupService.add_group_manager(member);

		model.addAttribute("Mdto", Mdto);

		return "redirect:/group_detail.do?g_seq="+Mdto.getG_seq();
	}
	// 그룹 리스트 출력
	@RequestMapping(value = "group_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_list(Model model, GroupListDTO gdto,String category) throws Exception {
		logger.info("CalendarController group_list " + new Date());
		
		if (category.equals("membership")) {
			
			List<GroupListDTO> g_list = new ArrayList<GroupListDTO>();
			
			g_list = groupService.group_list(gdto);

			model.addAttribute("g_list", g_list);

			return "group_list.tiles";
		}else if (category.equals("top")) {
			
			List<GroupMakeDTO> re_list = new ArrayList<GroupMakeDTO>();
			
			re_list = groupService.recommend_group_list(gdto);
			
			model.addAttribute("re_list", re_list);
			
			return "recommend_group_list.tiles";
		}else {
			return "recommend_group_list.tiles";
		}
		
	
		
	}
	@RequestMapping(value = "group_detail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail " + new Date());

		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail.tiles";
	}

	// 여기부터  멤버
	
	@RequestMapping(value = "group_detail_member.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_member(Model model, GroupMakeDTO gmake, int type) throws Exception {
		logger.info("CalendarController group_detail_member " + new Date());
	
		logger.info("키워드" + gmake.getKeyword());
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		List<GroupMemberListDTO> g_m_list = groupService.group_mem_list(gmake);
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
	public String group_detail_event(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail_event " + new Date());
	
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_event.tiles";
	}

	// 여기부터 사진
	@RequestMapping(value = "group_detail_photo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_photo(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail_photo " + new Date());
		
		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		
		return "group_detail_photo.tiles";
	}
	
	@RequestMapping(value = "group_detail_photo_video.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_photo_video(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail_photo_video " + new Date());

		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		
		return "group_detail_photo_video.tiles";
	}
	// 여기까지 사진
	// 파일
	@RequestMapping(value="group_detail_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_flie(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail_flie " + new Date());

		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_flie.tiles";
	}
	@RequestMapping(value="group_detail_upload_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_upload_flie(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail_upload_flie " + new Date());

		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_upload_flie.tiles";
	}
	@RequestMapping(value="group_detail_share_flie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_detail_share_flie(Model model, GroupMakeDTO gmake) throws Exception {
		logger.info("CalendarController group_detail_share_flie " + new Date());

		GroupMakeDTO g_make = groupService.group_detail(gmake);
		model.addAttribute("g_make", g_make);
		
		return "group_detail_share_flie.tiles";
	}

	
	//그룹 사진 등록
	
	@RequestMapping(value="group_main_image.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String group_main_image(Model model,GroupMakeDTO gmake,HttpServletRequest request,@RequestParam(value="fileload",required=false)
    MultipartFile fileload ) throws Exception {
		logger.info("CalendarController 메인이미지 " + new Date());
	
		 logger.info("fileload"+fileload);
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
	
}
