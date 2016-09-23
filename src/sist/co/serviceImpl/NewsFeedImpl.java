package sist.co.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.model.NewsFeedDTO;
import sist.co.service.NewsFeedDAO;
import sist.co.service.NewsFeedService;

@Service
public class NewsFeedImpl implements NewsFeedService {
	
	@Autowired
	private NewsFeedDAO newsFeeDAO;

	@Override
	public void writeNewsFeed(NewsFeedDTO dto) {
			newsFeeDAO.writeNewsFeed(dto);
	}

	@Override
	public void writeNewsFeedImage(NewsFeedDTO dto) {
			newsFeeDAO.writeNewsFeedImage(dto);		
	}

	@Override
	public List<NewsFeedDTO> getNewsFeedList() {
		return newsFeeDAO.getNewsFeedList();
	}

	@Override
	public NewsFeedDTO addPrintNewsFeed(int lastseq) {
		return newsFeeDAO.addPrintNewsFeed(lastseq);
	}

	@Override
	public void updateShow(HashMap<String, Integer> map){
			newsFeeDAO.updateShow(map);
		
	}

	@Override
	public void deleteNews(int seq) {
		newsFeeDAO.deleteNews(seq);
		
	}

	
	

	
}
