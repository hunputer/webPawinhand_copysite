package com.ph4.s1.communityReply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityReplyService {
	
	@Autowired
	private CommunityReplyDAO communityReplyDAO;
	
	public List<CommunityReplyDTO> getList(CommunityReplyPager communityReplyPager){
		communityReplyPager.makeRow();
		communityReplyPager.setTotalCount(communityReplyDAO.getCount(communityReplyPager));
		communityReplyPager.makePage();
		
		return communityReplyDAO.getList(communityReplyPager);
	}
	
	public int setDelete(CommunityReplyDTO communityReplyDTO) {
		return communityReplyDAO.setDelete(communityReplyDTO);
	}
	
	public int setInsert(CommunityReplyDTO communityReplyDTO) {
		return communityReplyDAO.setInsert(communityReplyDTO);
	}
	
	public CommunityReplyDTO getOne(CommunityReplyDTO communityReplyDTO) {
		return communityReplyDAO.getOne(communityReplyDTO);
	}
	
	public int setReply(CommunityReplyDTO communityReplyDTO) {
		int result = communityReplyDAO.setReplyUpdate(communityReplyDTO);
		result = communityReplyDAO.setReply(communityReplyDTO);
		return result;
	}
	
	public long getCount(CommunityReplyPager communityReplyPager) {
		return communityReplyDAO.getCount(communityReplyPager);
	}
}
