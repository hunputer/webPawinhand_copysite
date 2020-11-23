package com.ph4.s1.voluntary;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.util.Pager;
import com.ph4.s1.voluntary.file.VoluntaryFileDTO;

@Repository
public class VoluntaryDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ph4.s1.voluntary.VoluntaryDAO.";
	
	public List<VoluntaryDTO> getVoluntaryList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getVoluntaryList", pager);
	}
	
	public long getCount(Pager pager) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	
	public VoluntaryDTO getVoluntaryOne(VoluntaryDTO voluntaryDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getVoluntaryOne", voluntaryDTO);
	}
	
	public int setVoluntaryUpdate(VoluntaryDTO voluntaryDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setVoluntaryUpdate", voluntaryDTO);
	}
	
	public int setVoluntaryDelete(VoluntaryDTO voluntaryDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setVoluntaryDelete", voluntaryDTO);
	}
	
	public int setVoluntaryInsert(VoluntaryDTO voluntaryDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setVoluntaryInsert", voluntaryDTO);
	}
}
