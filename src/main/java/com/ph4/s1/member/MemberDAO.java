package com.ph4.s1.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.member.MemberDTO;
import com.ph4.s1.util.Pager;

import oracle.net.aso.m;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.ph4.s1.board.member.MemberDAO.";

	//MemberLogin
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberIdCheck", memberDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	
	public MemberDTO getOne(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne", memberDTO);
	}
	
	public List<MemberDTO> getList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public long getCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	
	public int setMemberUpdate_admin(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setMemberUpdate_admin", memberDTO);
	}
	
	



}