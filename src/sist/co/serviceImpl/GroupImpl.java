package sist.co.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.model.GroupPhotoDTO;
import sist.co.model.VoteDTO;
import sist.co.model.VotelistDTO;
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

	@Override
	public List<GroupMakeDTO> recommend_group_list(GroupListDTO glist) throws Exception {
		return groupDAO.recommend_group_list(glist);
	}

	@Override
	public boolean groupimageUpload(GroupMakeDTO gmake) throws Exception {
		groupDAO.groupimageUpload(gmake);
		return true;
	}

	@Override
	public List<GroupPhotoDTO> group_photo(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_photo(gmake);
	}

	@Override
	public List<GroupPhotoDTO> group_video(GroupMakeDTO gmake) throws Exception {
		return groupDAO.group_video(gmake);
	}


	@Override
	public boolean make_vote(VoteDTO vote) throws Exception {
		return groupDAO.make_vote(vote);
	}

	@Override
	public VoteDTO select_make_vote(VoteDTO vote) throws Exception {
		
		return groupDAO.select_make_vote(vote);
	}

	@Override
	public boolean add_vote(VotelistDTO vdto) throws Exception {
		
		return groupDAO.add_vote(vdto);
	}

	@Override
	public boolean add_newsfeed(VoteDTO vdto) throws Exception {
		return groupDAO.add_newsfeed(vdto);
	}
	

}
