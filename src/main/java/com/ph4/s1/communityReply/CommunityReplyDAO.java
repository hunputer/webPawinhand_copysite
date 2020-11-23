package com.ph4.s1.communityReply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.communityReply.CommunityReplyDAO.";
	
	public List<CommunityReplyDTO> getList(CommunityReplyPager communityReplyPager){
		return sqlSession.selectList(NAMESPACE+"getList", communityReplyPager);
	}
	
	public long getCount(CommunityReplyPager communityReplyPager) {
		return sqlSession.selectOne(NAMESPACE+"getCount", communityReplyPager);
	}
	
	public int setDelete(CommunityReplyDTO communityReplyDTO) {
		return sqlSession.update(NAMESPACE+"setDelete", communityReplyDTO);
	}
	
	public int setInsert(CommunityReplyDTO communityReplyDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", communityReplyDTO);
	}
	
	public CommunityReplyDTO getOne(CommunityReplyDTO communityReplyDTO) {
		return sqlSession.selectOne(NAMESPACE+"getOne", communityReplyDTO);
	}
	
	public int setReplyUpdate(CommunityReplyDTO communityReplyDTO) {
		return sqlSession.update(NAMESPACE+"setReplyUpdate", communityReplyDTO);
	}
	
	public int setReply(CommunityReplyDTO communityReplyDTO) {
		return sqlSession.insert(NAMESPACE+"setReply", communityReplyDTO);
	}
	
}
