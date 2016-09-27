package sist.co.service;


import java.util.List;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.model.GroupPhotoDTO;
import sist.co.model.GroupRequestDTO;
import sist.co.model.NewsFeedDTO;
import sist.co.model.VoteDTO;
import sist.co.model.VotelistDTO;

public interface GroupService {

	public boolean group_make(GroupMakeDTO group)throws Exception;
	
	public GroupMakeDTO select_make_group(GroupMakeDTO group)throws Exception;
	
	public boolean add_group_manager(GroupMemberDTO member)throws Exception;

	public List<GroupListDTO> group_list(GroupListDTO gdto)throws Exception;
	
	public GroupMakeDTO group_detail(GroupMakeDTO gmake)throws Exception;
	
	public List<GroupMemberListDTO> group_mem_list(GroupMakeDTO gmake)throws Exception;
	public List<GroupMemberListDTO> group_mem_admin_list(GroupMakeDTO gmake)throws Exception;
	
	public List<GroupMemberListDTO> group_mem_reply_list(GroupMakeDTO gmake)throws Exception;
	public List<GroupMemberListDTO> group_mem_block_list(GroupMakeDTO gmake)throws Exception;
	
	public List<GroupMakeDTO> recommend_group_list(GroupListDTO glist)throws Exception;
	
	public boolean groupimageUpload(GroupMakeDTO gmake)throws Exception;
	
	public List<GroupPhotoDTO> group_photo(GroupMakeDTO gmake)throws Exception;
	
	public List<GroupPhotoDTO> group_video(GroupMakeDTO gmake)throws Exception;
	
	public boolean make_vote(VoteDTO vote)throws Exception;
	
	public VoteDTO select_make_vote(VoteDTO vote)throws Exception;
	public boolean add_vote(VotelistDTO vdto)throws Exception;
	
	public boolean add_newsfeed(VoteDTO vdto)throws Exception;
	
	public List<GroupPhotoDTO> filelist(GroupMakeDTO gmake)throws Exception;
	public List<GroupPhotoDTO> upfilelist(GroupMakeDTO gmake)throws Exception;
	
	public boolean group_join_request(GroupRequestDTO rdto)throws Exception;
	
	public List<GroupMemberDTO> join_search(GroupRequestDTO rdto)throws Exception;

	public List<GroupRequestDTO> join_requset_search(GroupRequestDTO rdto)throws Exception;
	
	public List<GroupRequestDTO> requset_list(GroupMakeDTO gmake)throws Exception;
	
	public boolean accept_group(GroupRequestDTO gdto)throws Exception;
	public boolean no_accept_group(GroupRequestDTO gdto)throws Exception;
	
	public boolean add_group_member(GroupRequestDTO gdto)throws Exception;
	
	public List<GroupMemberDTO> select_mem(GroupMemberDTO g_memdto)throws Exception;
	
	public boolean out_groupjoin(GroupMemberDTO gdto)throws Exception;
	public boolean out_groupmember(GroupMemberDTO gdto)throws Exception;
	
	//테스트중
	public void group_writeNewsFeed(NewsFeedDTO ndto);
	public void group_writeNewsFeedImage(NewsFeedDTO ndto);
	
}
