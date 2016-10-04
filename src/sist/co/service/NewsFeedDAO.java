package sist.co.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.NewsFeedDTO;
import sist.co.model.NewsFeedLikeDTO;
import sist.co.model.NewsFeedListDTO;

@Repository
public class NewsFeedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String ns="NewsFeed.";

	public void writeNewsFeed(NewsFeedDTO dto){
		System.out.println("writeNewsFeed");
		sqlSession.insert(ns+"writeNewsFeed", dto);
	}
	
	
	public void writeNewsFeedImage(NewsFeedDTO dto){
		System.out.println("writeNewsFeedImage");
		sqlSession.insert(ns+"writeNewsFeedImage", dto);
		sqlSession.insert(ns+"writeNewsFeedImage2", dto);
	}
	
	public List<NewsFeedDTO> getAllNewsFeedList(){
	      List<NewsFeedDTO> list = sqlSession.selectList(ns+"getAllNewsFeedList");
	      return list;
	}
	
	public List<NewsFeedDTO> getNewsFeedList(NewsFeedListDTO newsfeedlistDTO){
		List<NewsFeedDTO> list = sqlSession.selectList(ns+"getNewsFeedList", newsfeedlistDTO);
		return list;
	}
	
	public List<NewsFeedDTO>  addPrintNewsFeed(int lastseq){
		List<NewsFeedDTO> list =  sqlSession.selectList(ns+"addPrintNewsFeed",lastseq);
		return list;
	}
	
	
	public void updateShow(HashMap<String, Integer> map){
		System.out.println("map.size()==="+map.size());
		System.out.println(map.get("updatenum"));
		sqlSession.update(ns+"updateShow",map);
	}
	
	public void deleteNews(int seq){
		sqlSession.update(ns+"deleteNews",seq);
	}
	
	public String getImageFile(int seq){
		return sqlSession.selectOne(ns+"getImageFile",seq);
	}
	
	
	public void insertLike(NewsFeedLikeDTO dto){
		System.out.println("insert들어옴");
		sqlSession.insert(ns+"insertLike",dto);
		sqlSession.update(ns+"addLikeCount",dto);
	}
	
	public void deleteLike (NewsFeedLikeDTO dto){
		System.out.println("delete들어옴");
		sqlSession.delete(ns+"deleteLike",dto);
		sqlSession.update(ns+"deleteLikeCount",dto);
	}
	
	
	public int getLikeListCount (NewsFeedLikeDTO dto){
		return sqlSession.selectOne(ns+"getLikeListCount",dto);
	}

	public List<String> getLikeList(int seq){
		List<String> list = sqlSession.selectList(ns+"getLikeList",seq);
		return list;
	}
	
	public void insertComment (NewsFeedDTO dto){
		sqlSession.update(ns+"updateComment",dto);
		sqlSession.insert(ns+"insertComment",dto);
	}
}






