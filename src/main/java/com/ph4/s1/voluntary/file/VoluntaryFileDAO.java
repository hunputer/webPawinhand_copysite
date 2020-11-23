package com.ph4.s1.voluntary.file;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.voluntary.VoluntaryDTO;

@Repository
public class VoluntaryFileDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.ph4.s1.voluntary.file.VoluntaryFileDAO.";
	
	public int setInsertFile(VoluntaryFileDTO voluntaryFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsertFile", voluntaryFileDTO);
	}
	
	public List<VoluntaryFileDTO> getOne(VoluntaryDTO voluntaryDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getOne", voluntaryDTO);
	}
	
	public List<VoluntaryFileDTO> getAll()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAll");
	}
	
	
	public int setFileDel(VoluntaryFileDTO voluntaryFileDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setFileDel", voluntaryFileDTO);
	}
	
}
