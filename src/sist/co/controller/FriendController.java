package sist.co.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import oracle.net.aso.f;
import sist.co.help.OrderHashMap;
import sist.co.help.SelectKeyword;
import sist.co.help.ValueComparator;
import sist.co.model.FriendDTO;
import sist.co.service.FriendService;
import sist.co.model.MemberDTO;

@Controller
public class FriendController {

	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService friendService;
	
	@RequestMapping(value="friendmain.do", method={RequestMethod.GET, RequestMethod.POST})
	public String friendmain(Model model) throws Exception{		
		logger.info("friendmain");
		return "friendmain.tiles";
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
		model.addAttribute("login_id", m_id);
		
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
		model.addAttribute("login_id", m_id);
		
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
		model.addAttribute("login_id", m_id);
		
		return "blockgroup.tiles";
	}
	
	
	
	
	@RequestMapping(value="outfriendsearchmain.do", method={RequestMethod.GET, RequestMethod.POST})
	public String outfriendsearchmain(String m_id, HttpServletRequest request, Model model) throws Exception{
		
		logger.info("outfriendsearchmain");
		
		m_id="qwer";	//임의의 m_id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		System.out.println("imgpath" + imgpath);
		
		//1. <친구의 친구 id, 내 친구들중 몇명과 친구를 맺고있는지> 
		HashMap<String, Integer> hashfsflist = new HashMap<String, Integer>();	// 내 친구들이 많이 아는 친구일 수록 리스트 상단에 떠야하는데 이를 위한 정렬을 위해 필요한 Hashmap.
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		System.out.println("flist.size():"+ flist.size());	
		
		for(int i = 0; i < flist.size(); i++){
			
			List<FriendDTO> fslist = friendService.getFriendsList(flist.get(i).getF_id());	// 내 친구의 친구리스트. 단, 나는 제외되어야함. because 알수도있는 친구에 내가 뜨면 안돼니.. 
			System.out.println(flist.get(i).getF_id()+ "의 fslist.size():"+ fslist.size());
			
			for(int j = 0; j < fslist.size(); j++){
				if(!hashfsflist.containsKey(fslist.get(j).getF_id())){
					hashfsflist.put(fslist.get(j).getF_id(), 1);
					//System.out.println("없쪙 " + fslist.get(j).getF_id());
				}else{				
					hashfsflist.put(fslist.get(j).getF_id(), hashfsflist.get(fslist.get(j).getF_id())+1);
					//System.out.println("있쪙 " + fslist.get(j).getF_id() +", " + hashfsflist.get(fslist.get(j).getF_id()));
				}
			}	
		}
		

		//2. 나 혹은 상대방이 친구요청 미수락한 경우는 검색리스트에 뜨면안됌. 따라서 hashfsflist에서 지워야함
		List<FriendDTO> ansflist = friendService.getAnsFriendsList(m_id); // 수신된 친구 요청 보기
		List<FriendDTO> askflist = friendService.getAskFriendsList(m_id); // 전송한 친구 요청 보기
		for(int i = 0; i < ansflist.size(); i++){
			hashfsflist.remove(ansflist.get(i).getM_id());
			System.out.println("삭제1 : " + ansflist.get(i).getM_id());
		}
		for(int i = 0; i < askflist.size(); i++){
			hashfsflist.remove(askflist.get(i).getF_id());
			System.out.println("삭제2 : " + askflist.get(i).getF_id());
		}
		
		
			
		//Hashmap value로 정렬한 최종 알수도있는친구(친구의 친구) 리스트
		List<MemberDTO> fsflistinform = new ArrayList<MemberDTO>();
		
		//3. order by Hashmap's Value (DESC)
		OrderHashMap orderhashmap = new OrderHashMap();
		List<String> orderfsflist = orderhashmap.orderbyValue(m_id, hashfsflist);
		for(int i = 0; i < orderfsflist.size(); i++){
			MemberDTO memdto = friendService.getFriendsInformation(orderfsflist.get(i));
			fsflistinform.add(memdto);
		}        

		model.addAttribute("fsflistinform", fsflistinform);
		model.addAttribute("login_id", m_id);	// 원래 세션에 저장된 로그인회원의 id. 세션에서 불러오지 않음. 이후에 세션에서 불러오는것으로 고쳐야함. (수정할점0919) 
		
		return "outfriendsearchmain.tiles";
	}
	
	//친구 외 검색(우측리스트)
	@RequestMapping(value="outfriendssearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String outfriendssearch(HttpServletRequest request, String m_id, @RequestParam(value="inputname") String inputname, @RequestParam(value="inputnickname") String inputnickname,
							@RequestParam(value="inputphone") String inputphone, @RequestParam(value="inputemail") String inputemail, 
							@RequestParam(value="inputaddress") String inputaddress, @RequestParam(value="inputhighschool") String inputhighschool, 
							@RequestParam(value="inputuniversity") String inputuniversity, @RequestParam(value="inputoffice") String inputoffice, 
							Model model) throws Exception{
		
		logger.info("outfriendssearch");
		
		m_id="qwer";	// 임시 id
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		//System.out.println("imgpath" + imgpath);
		
		// 1. 모르는 친구 
		MemberDTO memdto = new MemberDTO();
		memdto.setM_name(inputname);
		memdto.setM_nickname(inputnickname);
		memdto.setM_phone(inputphone);
		memdto.setM_id(inputemail);			// because of id==email.
		memdto.setM_address(inputaddress);
		memdto.setM_highschool(inputhighschool);
		memdto.setM_university(inputuniversity);
		memdto.setM_office(inputoffice);
		
		System.out.println(memdto.toString());
		
		//검색 keyword 선택  방법(1)controller에서 판별, 방법(2)view-javascript에서 판별
		SelectKeyword selw = new SelectKeyword();
		model.addAttribute("choosekeyword", selw.SearchWord(memdto));
		
		List<MemberDTO> searchflist = friendService.searchsomeone(memdto);	// 최종 검색 결과 (모르는 친구)
	
		System.out.println(searchflist.size());
		 
		// 2. 알수도 있는 친구 
		//<친구의 친구 id, 내 친구들중 몇명과 친구를 맺고있는지> 
		HashMap<String, Integer> hashfsflist = new HashMap<String, Integer>();	// 내 친구들이 많이 아는 친구일 수록 리스트 상단에 떠야하는데 이를 위한 정렬을 위해 필요한 Hashmap.
		List<FriendDTO> flist = friendService.getFriendsList(m_id);		// 해당 회원의 친구목록(요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외)
		System.out.println("flist.size():"+ flist.size());
		
		for(int i = 0; i < flist.size(); i++){
			
			List<FriendDTO> fslist = friendService.getFriendsList(flist.get(i).getF_id());	// 내 친구의 친구리스트. 단, 나는 제외되어야함. because 알수도있는 친구에 내가 뜨면 안돼니.. 
			System.out.println(flist.get(i).getF_id()+ "의 fslist.size():"+ fslist.size());
			
			for(int j = 0; j < fslist.size(); j++){
				if(!hashfsflist.containsKey(fslist.get(j).getF_id())){
					hashfsflist.put(fslist.get(j).getF_id(), 1);
					//System.out.println("없음 " + fslist.get(j).getF_id());
				}else{				
					hashfsflist.put(fslist.get(j).getF_id(), hashfsflist.get(fslist.get(j).getF_id())+1);
					//System.out.println("있음 " + fslist.get(j).getF_id() +", " + hashfsflist.get(fslist.get(j).getF_id()));
				}
			}	
		}
			
		
		
		//3. 나 혹은 상대방이 친구요청 미수락한 경우는 검색리스트에 뜨면안됌. 따라서 hashfsflist에서 지워야함
		List<FriendDTO> ansflist = friendService.getAnsFriendsList(m_id); // 수신된 친구 요청 보기
		List<FriendDTO> askflist = friendService.getAskFriendsList(m_id); // 전송한 친구 요청 보기
		for(int i = 0; i < ansflist.size(); i++){
			hashfsflist.remove(ansflist.get(i).getM_id());
			for(int j = 0; j < searchflist.size(); j++){
				if(searchflist.get(j).getM_id().equals(ansflist.get(i).getM_id()))
					searchflist.remove(j);	
			}
			System.out.println("삭제1 : " + ansflist.get(i).getM_id());
		}
		for(int i = 0; i < askflist.size(); i++){
			hashfsflist.remove(askflist.get(i).getF_id());
			for(int j = 0; j < searchflist.size(); j++){
				if(searchflist.get(j).getM_id().equals(askflist.get(i).getF_id()))
					searchflist.remove(j);	
			}
			System.out.println("삭제2 : " + askflist.get(i).getF_id());
		}

		
		
		
		//Hashmap value로 정렬한 최종 알수도있는친구(친구의 친구) 리스트
		List<MemberDTO> fsflistinform = new ArrayList<MemberDTO>();			// 최종 검색 결과 (알수도 있는 친구)
		
		//order by Hashmap's Value (DESC)
		OrderHashMap orderhashmap = new OrderHashMap();
		List<String> orderfsflist = orderhashmap.orderbyValue(m_id, hashfsflist);
		for(int i = 0; i < orderfsflist.size(); i++){
			MemberDTO memdtotmp = friendService.getFriendsInformation(orderfsflist.get(i));
			//System.out.println("memdtotmp: " + memdtotmp.getM_id());
			fsflistinform.add(memdtotmp);
		}   

		
		// 4. 모르는 친구 와 알수도있는친구(친구의친구) 검색결과에서 (1) 중복되는 친구는 모르는 친구 검색결과 리스트에서 삭제. (2) 알수도있는 친구리스트에선 중복된 친구만 따로 리스트에 저장
		List<MemberDTO> fssearchflist = new ArrayList<MemberDTO>();	// 알수도있는 친구리스트에선 중복된 친구 저장하는 리스트-(2)번처리관련 
		  		
		//(1) 중복되는 친구는 모르는 친구 검색결과 리스트에서 삭제.
		for(int j = 0; j < fsflistinform.size(); j++){
			for(int i = 0; i < searchflist.size(); i++){
				//System.out.println(searchflist.get(i).getM_id());
				if(fsflistinform.get(j).getM_id().equals(searchflist.get(i).getM_id())){
					//System.out.println("지운당 " + searchflist.get(i).getM_id());
					searchflist.remove(i);							// 단순히 삭제하면 index가 삭제되면 자동으로 index가 다시 재넘버링되어 체크 안하게 되는 index가 생기게 됨. 
					fssearchflist.add(fsflistinform.get(j));		// (2) 알수도있는 친구리스트에선 중복된 친구만 따로 리스트에 저장 
				}
			}
		}
		
		// 5. 원래 내 친구들은 '친구외 검색'에서 '검색된친구'에 뜨면안됌. 따라서 리스트에서 삭제해준다.
		//flist : 요청수락안한 친구, 차단한 친구, 비활성화된 친구 를 제외, follow친구를 포함한 리스트
		for(int i = 0; i < flist.size(); i++){
			for(int j = 0; j < searchflist.size(); j++){
				if(flist.get(i).getF_id().equals(searchflist.get(j).getM_id())){
					searchflist.remove(j);
				}
			}
		}
		
		
		model.addAttribute("fssearchflist", fssearchflist);
		model.addAttribute("searchflist", searchflist);
		model.addAttribute("login_id", m_id);	
		
		return "outfriendssearch.tiles";
	}
	
	@RequestMapping(value="befriends.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String befriends(@RequestParam(value = "m_id", required = false) String m_id,
							@RequestParam(value = "f_id", required = false) String f_id){
		
		logger.info("befriends");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		System.out.println("m_id : "+m_id+", f_id : "+f_id);
		
		boolean isS = false;
		
		try{
			friendService.befriend(friendDTO);
			isS = true;
		}catch (Exception e) {
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping(value="accept.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String accept(@RequestParam(value = "m_id", required = false) String m_id, 
						 @RequestParam(value = "f_id", required = false) String f_id){
		
		logger.info("accept");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.accept(friendDTO);
			isS = true;
		}catch (Exception e) {
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping(value="refuse.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String refuse(@RequestParam(value = "m_id", required = false) String m_id, 
						 @RequestParam(value = "f_id", required = false) String f_id){
		
		logger.info("refuse");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.refuse(friendDTO);
			isS = true;
			System.out.println("isS : " + isS);
		}catch (Exception e) {
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	
	@RequestMapping(value="cancle.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String cancle(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id){
		
		logger.info("cancle");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.cancle(friendDTO);
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
	}

	
	@RequestMapping(value="stranger.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String stranger(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id){
	

		logger.info("stranger");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.stranger(friendDTO);
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping(value="block.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String block(@RequestParam(value="m_id", required=false) String m_id, 
						 @RequestParam(value="f_id", required=false) String f_id){
	

		logger.info("block");
		
		FriendDTO friendDTO = new FriendDTO();
		friendDTO.setM_id(m_id);
		friendDTO.setF_id(f_id);
		
		boolean isS = false;
		
		try{
			friendService.block(friendDTO);
			isS = true;
		}catch(Exception e){
			e.getMessage();
		}
		
		if(isS){
			return f_id;
		}else{
			return "fail";
		}
		
		
	}
	
/*	@RequestMapping(value="infriendssearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String infriendssearch(HttpServletRequest request, String m_id, @RequestParam(value="insearchname") String insearchname){
	
		logger.info("infriendssearch");
		
		//profile 경로
		String imgpath = request.getServletContext().getRealPath("/upload");
		
		
		
		
		
		return "infriendssearch.tiles";
	}
	
*/













}
