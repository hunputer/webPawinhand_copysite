package com.ph4.s1.voluntary.reserve;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.voluntary.file.VoluntaryFileDTO;

@Repository
public class VoluntaryReserveDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="";
	
	public int setResInsert(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setResInsert", voluntaryReserveDTO);
	}
	
	public List<VoluntaryReserveDTO> getResList(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getResList", voluntaryReserveDTO);
	}
	
	public VoluntaryReserveDTO getResOne(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getResOne", voluntaryReserveDTO);
	}
	
	public int setResDel(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setResDel", voluntaryReserveDTO);
	}

}
