package sist.co.service.Impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.service.GroupDAO;
import sist.co.service.GroupService;
@Service
public class GroupImpl implements GroupService {

	@Autowired
	private GroupDAO groupDAO;
	
	@Override
	public boolean group_make(GroupMakeDTO group) throws Exception {
		return groupDAO.group_make(group);
	}

	@Override
	public GroupMakeDTO select_make_group(GroupMakeDTO group) throws Exception {
		
		return groupDAO.select_make_group(group);
	}

	@Override
	public boolean add_group_manager(GroupMemberDTO member) throws Exception {

		return groupDAO.add_group_manager(member);
	}

	@Override
	public List<GroupListDTO> group_list(GroupListDTO gdto) throws Exception {
		return groupDAO.group_list(gdto);
	}

	@Override
	public GroupMakeDTO group_detail(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_detail(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_mem_list(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_admin_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_mem_admin_list(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_reply_list(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_mem_reply_list(gmake);
	}

	@Override
	public List<GroupMemberListDTO> group_mem_block_list(GroupMakeDTO gmake) throws Exception {
		
		return groupDAO.group_mem_block_list(gmake);
	}
	
	

}
