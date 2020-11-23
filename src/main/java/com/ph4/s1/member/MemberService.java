package com.ph4.s1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ph4.s1.util.Pager;


@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	public MemberDTO getOne(MemberDTO memberDTO) throws Exception{
		return memberDAO.getOne(memberDTO);
	}
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberIdCheck(memberDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.setMemberJoin(memberDTO);
	}
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception{
		return memberDAO.setMemberDelete(memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.setMemberUpdate(memberDTO);
	}
	
	public List<MemberDTO> getList(Pager pager) throws Exception{
		pager.makeRow();
		pager.setTotalCount(memberDAO.getCount(pager));
		pager.makePage();
		return memberDAO.getList(pager);
	}
	
	public int setMemberUpdate_admin(MemberDTO memberDTO) throws Exception{
		return memberDAO.setMemberUpdate_admin(memberDTO);
	}
}
