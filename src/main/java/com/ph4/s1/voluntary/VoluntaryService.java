package com.ph4.s1.voluntary;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.util.FileSaver;
import com.ph4.s1.util.Pager;
import com.ph4.s1.voluntary.file.VoluntaryFileDAO;
import com.ph4.s1.voluntary.file.VoluntaryFileDTO;
import com.ph4.s1.voluntary.reserve.VoluntaryReserveDAO;
import com.ph4.s1.voluntary.reserve.VoluntaryReserveDTO;

@Service
public class VoluntaryService {

	@Autowired
	private VoluntaryDAO voluntaryDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private VoluntaryFileDAO voluntaryFileDAO;
	@Autowired
	private VoluntaryReserveDAO voluntaryReserveDAO;
	
	public List<VoluntaryDTO> getVoluntaryList(Pager pager) throws Exception{
		pager.makeRow();
		pager.setTotalCount(voluntaryDAO.getCount(pager));
		pager.makePage();
		
		return voluntaryDAO.getVoluntaryList(pager);
	}
	
	public VoluntaryDTO getVoluntaryOne(VoluntaryDTO voluntaryDTO) throws Exception{
		return voluntaryDAO.getVoluntaryOne(voluntaryDTO);
	}
	
	public int setVoluntaryUpdate(VoluntaryDTO voluntaryDTO, MultipartFile[] files, HttpSession session) throws Exception{
		
		//파일을 HDD에 저장 /resources/upload/notice
		String path = session.getServletContext().getRealPath("/resources/upload/voluntary/");
		File file = new File(path);
		System.out.println(path);
			
		//voluntaryDTO update
		int result = voluntaryDAO.setVoluntaryUpdate(voluntaryDTO);
			
		//---- voluntaryFile Insert		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize() !=0) {
				String fileName = fileSaver.saveCopy(file, multipartFile);
								
				VoluntaryFileDTO voluntaryFileDTO = new VoluntaryFileDTO();
				voluntaryFileDTO.setFileName(fileName);
				voluntaryFileDTO.setOriName(multipartFile.getOriginalFilename());
				voluntaryFileDTO.setNum(voluntaryDTO.getNum());
								
				voluntaryFileDAO.setInsertFile(voluntaryFileDTO);
					}
				}
						
		return result;
		
	}
	
	public int setVoluntaryDelete(VoluntaryDTO voluntaryDTO) throws Exception{
		return voluntaryDAO.setVoluntaryDelete(voluntaryDTO);
	}
	
	//파일 지우기
	public int setFileDel(VoluntaryFileDTO voluntaryFileDTO, HttpSession session) throws Exception{
		
		String fileName = voluntaryFileDTO.getFileName();
		System.out.println(fileName);
		String path = session.getServletContext().getRealPath("/resources/upload/voluntary/"+fileName);
		File file = new File(path);
		
		if(file.exists() == true){
			System.out.println("file if문 들어옴");
			file.delete();

		}
		return voluntaryFileDAO.setFileDel(voluntaryFileDTO);
	}
	//파일 하드에 저장하기
	public int setVoluntaryInsert(VoluntaryDTO voluntaryDTO, MultipartFile[] files, HttpSession session) throws Exception{
		//파일을 HDD에 저장 /resources/upload/notice
		String path = session.getServletContext().getRealPath("/resources/upload/voluntary/");
		File file = new File(path);
		System.out.println(path);
		System.out.println("Num : "+voluntaryDTO.getNum());
	
		//voluntaryDTO insert
		int result = voluntaryDAO.setVoluntaryInsert(voluntaryDTO);
	
		//---- voluntaryFile Insert		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize() !=0) {
				String fileName = fileSaver.saveCopy(file, multipartFile);
						
				VoluntaryFileDTO voluntaryFileDTO = new VoluntaryFileDTO();
				voluntaryFileDTO.setFileName(fileName);
				voluntaryFileDTO.setOriName(multipartFile.getOriginalFilename());
				voluntaryFileDTO.setNum(voluntaryDTO.getNum());
						
				voluntaryFileDAO.setInsertFile(voluntaryFileDTO);
			}
		}
				
				return result;
	}
	
	public List<VoluntaryFileDTO> getOne(VoluntaryDTO voluntaryDTO) throws Exception{
		return voluntaryFileDAO.getOne(voluntaryDTO);
	}
	
	public List<VoluntaryFileDTO> getAll() throws Exception{
		return voluntaryFileDAO.getAll();
	}
	
	public int setResInsert(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		return voluntaryReserveDAO.setResInsert(voluntaryReserveDTO);
	}
	
	public List<VoluntaryReserveDTO> getResList(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		//달력의 월/일 에서 일 에 해당하는 숫자만 뽑아서 resDate에 다시 넣음
		//jsp에서 사용하기 위함
		List<VoluntaryReserveDTO> ar = voluntaryReserveDAO.getResList(voluntaryReserveDTO);
		
		for(int i =0; i<ar.size(); i++) {
			String [] day = ar.get(i).getResDate().split("-");
			
			for(int j =0; j<day.length; j++) {
				
				if(j==0) {
				ar.get(i).setYear(Integer.parseInt(day[j].trim()));
				}else if(j==1) {
					ar.get(i).setMonth(Integer.parseInt(day[j].trim()));
				}else {
					ar.get(i).setDate(Integer.parseInt(day[j].trim()));
				}
			}
			
		}
					return ar;

	}
	
	public VoluntaryReserveDTO getResOne(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		return voluntaryReserveDAO.getResOne(voluntaryReserveDTO);
	}
	
	public int setResDel(VoluntaryReserveDTO voluntaryReserveDTO) throws Exception{
		return voluntaryReserveDAO.setResDel(voluntaryReserveDTO);
	}

}