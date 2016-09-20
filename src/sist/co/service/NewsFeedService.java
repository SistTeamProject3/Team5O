package sist.co.service;

import java.util.HashMap;
import java.util.List;
import sist.co.model.NewsFeedDTO;

public interface NewsFeedService {

	public void writeNewsFeed(NewsFeedDTO dto);
	public void writeNewsFeedImage(NewsFeedDTO dto);
	public List<NewsFeedDTO> getNewsFeedList();
	public NewsFeedDTO addPrintNewsFeed(int lastseq);
	public void updateShow(HashMap<String, Integer> map);
}
