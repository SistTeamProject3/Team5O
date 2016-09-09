package sist.co.service;


import java.util.List;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;

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
}
