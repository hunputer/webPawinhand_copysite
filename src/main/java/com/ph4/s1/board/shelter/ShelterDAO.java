package com.ph4.s1.board.shelter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.board.file.ShelterFileDTO;
import com.ph4.s1.util.Pager;

@Repository
public class ShelterDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String namespace = "com.ph4.s1.board.shelter.ShelterDAO.";
	
	
	public List<ShelterDTO> getList(Pager pager) throws Exception{
		return sqlSession.selectList(namespace+"getList", pager);
	}
	
	public long getCount(Pager pager) throws Exception{
		return sqlSession.selectOne(namespace+"getCount", pager);
	}
	
	public int setInsert(ShelterDTO shelterDTO) throws Exception{
		return sqlSession.insert(namespace+"setInsert", shelterDTO);
	}
	
	public ShelterDTO getOne(ShelterDTO shelterDTO) throws Exception{
		return sqlSession.selectOne(namespace+"getOne", shelterDTO);
	}
	
	public int setDelete(ShelterDTO shelterDTO) throws Exception{
		return sqlSession.delete(namespace+"setDelete", shelterDTO);
	}
	
	public int setUpdate(ShelterDTO shelterDTO) throws Exception{
		return sqlSession.update(namespace+"setUpdate", shelterDTO);
	}
	
	
	//-------------File---------------------------------------
	
	public int setinsertFile(ShelterFileDTO shelterFileDTO) throws Exception{
		return sqlSession.insert(namespace+"setInsertFile", shelterFileDTO);
	}
	
	
	public List<ShelterFileDTO> getFileOne(ShelterDTO shelterDTO)throws Exception{
		return sqlSession.selectList(namespace+"getFileOne", shelterDTO);
	}
	
}
