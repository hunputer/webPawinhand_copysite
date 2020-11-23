package com.ph4.s1.board.shelter;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.board.file.ShelterFileDTO;
import com.ph4.s1.util.FileSaver;
import com.ph4.s1.util.Pager;
import com.ph4.s1.voluntary.VoluntaryDTO;
import com.ph4.s1.voluntary.file.VoluntaryFileDTO;

@Service
public class ShelterSevice {
	
	@Autowired
	private ShelterDAO shelterDAO;
	@Autowired
	private FileSaver fileSaver;
	
	public List<ShelterDTO> getList(Pager pager) throws Exception{
		pager.makeRow();
		pager.setTotalCount(shelterDAO.getCount(pager));
		pager.makePage();
		return shelterDAO.getList(pager);
	}
	
	public ShelterDTO getOne(ShelterDTO shelterDTO) throws Exception{
		return shelterDAO.getOne(shelterDTO);
	}
	
	public int setInsert(ShelterDTO shelterDTO, MultipartFile [] files, HttpSession session) throws Exception{
		
		//파일을 HDD에 저장
		String path = session.getServletContext().getRealPath("/resources/upload/shelter/");
		File file = new File(path);
		System.out.println(path);
		
		int result = shelterDAO.setInsert(shelterDTO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize() !=0) {
				String fileName = fileSaver.saveCopy(file, multipartFile);
				ShelterFileDTO shelterFileDTO = new ShelterFileDTO();
				shelterFileDTO.setFileName(fileName);
				shelterFileDTO.setOriName(multipartFile.getOriginalFilename());
				shelterFileDTO.setNum(shelterDTO.getNum());
				
				shelterDAO.setinsertFile(shelterFileDTO);
			}
		}
			
		return result;
	}
	
	
	public int setDelete(ShelterDTO shelterDTO) throws Exception{
		return shelterDAO.setDelete(shelterDTO);
	}
	
	public int setUpdate(ShelterDTO shelterDTO) throws Exception{
		return shelterDAO.setUpdate(shelterDTO);
	}
	
	
//-------------------File-------------------------------------
	
	public List<ShelterFileDTO> getFileOne(ShelterDTO shelterDTO) throws Exception{
		return shelterDAO.getFileOne(shelterDTO);
	}
}
