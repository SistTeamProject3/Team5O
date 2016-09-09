package sist.co.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.net.aso.f;
import sist.co.model.FriendDTO;
import sist.co.service.FriendService;
import sist.co.model.MemberDTO;

@Controller
public class FriendController {

	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService friendService;
	
	@RequestMapping(value="friendsearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String friendsearch(Model model) throws Exception{		
		logger.info("friendsearch");
		return "friendsearch.tiles";
	}
	
	@RequestMapping(value="infriendsearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String infriendsearch(String m_id, HttpServletRequest request, Model model) throws Exception{		
		logger.info("infriendsearch");
		
		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		//요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외, follow친구를 포함한 리스트  + 이 친구 각각의 한마디글 뽑아오기
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		//수정할점0908 list정렬 : collection.sort(list명) 단, list<string>.

		HashMap<String, MemberDTO> finformlist = new HashMap<String, MemberDTO>();
		for(int i = 0; i < flist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(flist.get(i).getF_id());	
			finformlist.put(flist.get(i).getF_id(), memdto);		// 친구아이디를 key값으로 친구의 한마디 글 뽑아오기
		}
		
		
		model.addAttribute("flist", flist);				// 그룹 단위로 출력하기 위해서 필요함. 즉,순수하게 정렬하기 위해 필요 : (수정할점0906) 그룹별 출력, 그룹변경 할 수 있도록 버튼만들기 
		model.addAttribute("finformlist", finformlist);	// 해당 회원 모든 친구들의 정보 
		model.addAttribute("imgpath", imgpath);
		

		/*model.addAttribute("searchtext", searchtext);*/
		
		/*
		request.getAttribute("searchtext");
		System.out.println("confirm :"+ request.getAttribute("searchtext"));
		model.addAttribute("searchtext", request.getAttribute("searchtext"));*/
//				
		System.out.println("success");

		return "infriendsearch.tiles";
	}
	
	@RequestMapping(value="friendlist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String friendlist(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("friendsearch");
		
		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		//요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외, follow친구를 포함한 리스트  + 이 친구 각각의 한마디글 뽑아오기
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		//수정할점0908 list정렬 : collection.sort(list명) 단, list<string>.

		HashMap<String, MemberDTO> finformlist = new HashMap<String, MemberDTO>();
		for(int i = 0; i < flist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(flist.get(i).getF_id());	
			finformlist.put(flist.get(i).getF_id(), memdto);		// 친구아이디를 key값으로 친구의 한마디 글 뽑아오기
		}
		
		
		model.addAttribute("flist", flist);				// 그룹 단위로 출력하기 위해서 필요함. 즉,순수하게 정렬하기 위해 필요 : (수정할점0906) 그룹별 출력, 그룹변경 할 수 있도록 버튼만들기 
		model.addAttribute("finformlist", finformlist);	// 해당 회원 모든 친구들의 정보 
		model.addAttribute("imgpath", imgpath);
		

		/*model.addAttribute("searchtext", searchtext);*/
		
		/*
		request.getAttribute("searchtext");
		System.out.println("confirm :"+ request.getAttribute("searchtext"));
		model.addAttribute("searchtext", request.getAttribute("searchtext"));*/
//		
		System.out.println("success");
		
		return "friendlist.tiles";
	}
	
	@RequestMapping(value="friendask.do", method={RequestMethod.GET, RequestMethod.POST})
	public String friendask(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("friendask");
		
		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
				
		// 수신된 친구 요청 보기
		List<FriendDTO> ansflist = friendService.getAnsFriendsList(m_id);
		List<MemberDTO> ansflistinform = new ArrayList<MemberDTO>();
		System.out.println("ansflist.size()"+ansflist.size());
		for(int i = 0; i < ansflist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(ansflist.get(i).getM_id());	
			ansflistinform.add(memdto);
		}
		
		// 전송한 친구 요청 보기
		List<FriendDTO> askflist = friendService.getAskFriendsList(m_id);
		List<MemberDTO> askflistinform = new ArrayList<MemberDTO>();
		System.out.println("askflist.size()"+askflist.size());
		for(int i = 0; i < askflist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(askflist.get(i).getF_id());
			askflistinform.add(memdto);
		}
		
		model.addAttribute("ansflistinform", ansflistinform);
		model.addAttribute("askflistinform", askflistinform);
		model.addAttribute("imgpath", imgpath);
		
		return "friendask.tiles";
	}
	
	// 그룹별 관리 대메뉴(친구관리)
	// 그룹별 관리 메뉴1(가족) : 서로친구만 가족그룹으로 만들수 있음 
	@RequestMapping(value="familygroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String familygroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("familygroup");
		
		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
			
		List<String> familylist = friendService.getFamilyList(m_id);			// 해당 회원의 친구목록
		List<MemberDTO> familylistinform = new ArrayList<MemberDTO>();			// 친구의 인적사항
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < familylist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(familylist.get(i));
			
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			familylistinform.add(memdto);
			
		}
		
		model.addAttribute("familylistinform", familylistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		
		return "familygroup.tiles";
	}
	
	// 그룹별 관리 메뉴2(친한친구) : 서로친구만 친한친구그룹으로 만들수 있음 
	@RequestMapping(value="bestgroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bestgroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("bestgroup");

		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		List<String> bestlist = friendService.getBestFriendsList(m_id);
		List<MemberDTO> bestlistinform = new ArrayList<MemberDTO>();
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < bestlist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(bestlist.get(i));
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			bestlistinform.add(memdto);
		}
		
		model.addAttribute("bestlistinform", bestlistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		
		return "bestgroup.tiles";
	}
	
	// 그룹별 관리 메뉴3(친구) : follow친구는 무조건 아는친구(2)그룹 ===> 즉, 친한친구가 되기 위해선 반드시 서로친구가 되어야함
	@RequestMapping(value="knowgroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Knowgroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("knowgroup");
		
		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		List<FriendDTO> knowlist = friendService.getKnowList(m_id);		// 아는친구, follow친구 포함
		List<MemberDTO> knowlistinform = new ArrayList<MemberDTO>();
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < knowlist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(knowlist.get(i).getF_id());
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			knowlistinform.add(memdto);
		}
		
		model.addAttribute("knowlist", knowlist);				// follow친구, 아는친구(서로친구)구분하기 위해 넘김
		model.addAttribute("knowlistinform", knowlistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		
		return "knowgroup.tiles";
	}
	
	// 그룹별 관리 메뉴4(차단)
	@RequestMapping(value="blockgroup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String blockgroup(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("blockgroup");
		
		m_id="qwer";	// 임시 회원 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		List<String> blocklist = friendService.getBlockList(m_id);
		List<MemberDTO> blocklistinform = new ArrayList<MemberDTO>();
		HashMap<String, Integer> fstotalnum = new HashMap<String, Integer>();	// 친구가 맺은 총 친구 인원수 출력
		for(int i = 0; i < blocklist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(blocklist.get(i));
			fstotalnum.put(memdto.getM_id(), friendService.getFriendsTotalNumOfFriends(memdto.getM_id()));
			blocklistinform.add(memdto);
		}
		
		model.addAttribute("blocklistinform", blocklistinform);
		model.addAttribute("fstotalnum", fstotalnum);
		model.addAttribute("imgpath", imgpath);
		
		return "blockgroup.tiles";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
