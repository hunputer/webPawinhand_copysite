 package com.ph4.s1.board.community;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.board.BoardDTO;
import com.ph4.s1.board.BoardService;
import com.ph4.s1.board.boardFile.BoardFileDAO;
import com.ph4.s1.board.boardFile.BoardFileDTO;
import com.ph4.s1.util.Pager;

import oracle.jdbc.OracleConnection.CommitOption;

@Service
public class CommunityService implements BoardService{

	@Autowired
	private CommunityDAO communityDAO;
	@Autowired
	private BoardFileDAO boardFileDAO;
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.setTotalCount(communityDAO.getCount(pager));
		pager.makePage();
		return communityDAO.getList(pager);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public CommunityDTO getOne(BoardDTO boardDTO) throws Exception {
		//communityDAO.setHit(boardDTO.getNum());
		return communityDAO.getOne(boardDTO);
	}

	public int setInsert(CommunityDTO communityDTO) throws Exception {
		return communityDAO.setInsert(communityDTO);
	}

	
	public int setUpdate(CommunityDTO communityDTO, MultipartFile[] files, HttpSession httpSession) throws Exception {
		int result = communityDAO.setUpdate(communityDTO);
	

		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		return communityDAO.setDelete(boardDTO);
	}

	

}
