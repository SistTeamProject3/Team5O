package sist.co.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.GroupListDTO;
import sist.co.model.GroupMakeDTO;
import sist.co.model.GroupMemberDTO;
import sist.co.model.GroupMemberListDTO;

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
}
