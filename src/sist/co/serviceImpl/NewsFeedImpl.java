package sist.co.serviceImpl;

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

	

	
}
