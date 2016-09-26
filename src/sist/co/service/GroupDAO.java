package sist.co.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;
import sist.co.model.GroupPhotoDTO;
import sist.co.model.GroupRequestDTO;
import sist.co.model.VoteDTO;
import sist.co.model.VotelistDTO;

@Repository
public class GroupDAO {

	@Autowired	
	private SqlSession sqlSession;		
	private String ns="Group.";
	
	
	public boolean group_make(GroupMakeDTO group)throws Exception{
		sqlSession.insert(ns+"group_make", group);
		return true;
	}
	public GroupMakeDTO select_make_group(GroupMakeDTO group)throws Exception{
		GroupMakeDTO dto = sqlSession.selectOne(ns+"select_make_group", group);
		return dto;
	}
	
	public List<GroupMemberDTO> select_mem(GroupMemberDTO g_memdto)throws Exception{
		return sqlSession.selectList(ns+"select_mem", g_memdto);
	}
	
	public boolean add_group_manager(GroupMemberDTO member)throws Exception{
		sqlSession.insert(ns+"add_group_manager", member);
		return true;
	}
	
	public List<GroupListDTO> group_list(GroupListDTO gdto)throws Exception{
		 List<GroupListDTO> glist = sqlSession.selectList(ns+"group_list", gdto);
		return glist;
	}

	public GroupMakeDTO group_detail(GroupMakeDTO gmake)throws Exception{
		GroupMakeDTO g_make = sqlSession.selectOne(ns+"group_detail", gmake);
		return g_make;
	}
	
	public List<GroupMemberListDTO> group_mem_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_list = sqlSession.selectList(ns+"group_mem_list", gmake);
		return g_m_list;
	}
	public List<GroupMemberListDTO> group_mem_admin_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_a_list = sqlSession.selectList(ns+"group_mem_admin_list", gmake);
		return g_m_a_list;
	}
	public List<GroupMemberListDTO> group_mem_reply_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_r_list = sqlSession.selectList(ns+"group_mem_reply_list", gmake);
		return g_m_r_list;
	}
	public List<GroupMemberListDTO> group_mem_block_list(GroupMakeDTO gmake)throws Exception{
		List<GroupMemberListDTO> g_m_b_list = sqlSession.selectList(ns+"group_mem_block_list", gmake);
		return g_m_b_list;
	}
	
	public List<GroupMakeDTO> recommend_group_list(GroupListDTO glist)throws Exception{
		
		List<GroupMakeDTO> re_list = sqlSession.selectList(ns+"recommend_group_list", glist);
		return re_list;
	} 
	public boolean groupimageUpload(GroupMakeDTO gmake)throws Exception{
		sqlSession.update(ns+"groupimageUpload",gmake);
		return true;
	}
	
	public List<GroupPhotoDTO> group_photo(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> g_photolist = sqlSession.selectList(ns+"group_photo", gmake);
		return g_photolist;
	}
	
	public List<GroupPhotoDTO> group_video(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> g_videolist = sqlSession.selectList(ns+"group_video", gmake);
		return g_videolist;
	}
	public boolean make_vote(VoteDTO vote)throws Exception{
		sqlSession.insert(ns+"make_vote", vote);
		return true;
	}
	public VoteDTO select_make_vote(VoteDTO vote)throws Exception{
		return sqlSession.selectOne(ns+"select_make_vote", vote);
	}
	
	public boolean add_vote(VotelistDTO vdto)throws Exception{
		 sqlSession.insert(ns+"add_vote", vdto);
		 return true;
	}
	
	public boolean add_newsfeed(VoteDTO vdto)throws Exception{
		sqlSession.insert(ns+"add_newsfeed", vdto);
		return true;
	}
	
	public List<GroupPhotoDTO> filelist(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> flist = sqlSession.selectList(ns+"filelist", gmake);
		return flist;
	}
	public List<GroupPhotoDTO> upfilelist(GroupMakeDTO gmake)throws Exception{
		List<GroupPhotoDTO> flist = sqlSession.selectList(ns+"upfilelist", gmake);
		return flist;
	}
	
	public boolean group_join_request(GroupRequestDTO rdto)throws Exception{
		sqlSession.insert(ns+"group_join_request", rdto);
		return true;
	}
	
	public List<GroupMemberDTO> join_search(GroupRequestDTO rdto)throws Exception{
		return sqlSession.selectList(ns+"join_search", rdto);
	}	
	
	public List<GroupRequestDTO> join_requset_search(GroupRequestDTO rdto)throws Exception{
		return sqlSession.selectList(ns+"join_requset_search", rdto);
	}	
	
	public List<GroupRequestDTO> requset_list(GroupMakeDTO gmake)throws Exception{
		List<GroupRequestDTO> list = sqlSession.selectList(ns+"requset_list", gmake);
		return list;
	}

	public boolean accept_group(GroupRequestDTO gdto)throws Exception{
		sqlSession.update(ns+"accept_group", gdto);
		return true;
	}
	public boolean no_accept_group(GroupRequestDTO gdto)throws Exception{
		sqlSession.update(ns+"no_accept_group", gdto);
		return true;
	}
	
	public boolean add_group_member(GroupRequestDTO gdto)throws Exception{
		sqlSession.insert(ns+"add_group_member", gdto);
		return true;
	}
	
	public boolean out_groupjoin(GroupMemberDTO gdto)throws Exception{
		sqlSession.delete(ns+"out_groupjoin", gdto);
		return true;
	}
	public boolean out_groupmember(GroupMemberDTO gdto)throws Exception{
		sqlSession.delete(ns+"out_groupmember", gdto);
		return true;
	}
	
}
