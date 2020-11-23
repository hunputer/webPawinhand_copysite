package com.ph4.s1.store.product;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.store.storeFile.StoreFileDAO;
import com.ph4.s1.store.storeFile.StoreFileDTO;
import com.ph4.s1.util.FileSaver;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private StoreFileDAO storeFileDAO;
	@Autowired
	private FileSaver fileSaver;
	
	public ProductDTO getOne(ProductDTO productDTO) {
		return productDAO.getOne(productDTO);
	}
	
	public List<ProductDTO> getList(ProductDTO productDTO){
		List<ProductDTO> ar = productDAO.getList(productDTO);
		for(ProductDTO dto : ar) {
			StoreFileDTO fileDTO = storeFileDAO.getOne(dto);
			if(fileDTO != null) {
				dto.setFileName(fileDTO.getFileName());
			}
		}
		return ar;
	}
	
	public int setInsert(ProductDTO productDTO, MultipartFile[] files, HttpSession httpSession) throws Exception{
		int result = productDAO.setInsert(productDTO);
		
		String path = httpSession.getServletContext().getRealPath("/resources/img/upload/product");
		System.out.println(path);
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		for(MultipartFile f : files) {
			if(f.getSize() != 0) {
				String fileName = fileSaver.save(file, f);
				StoreFileDTO fileDTO = new StoreFileDTO();
				fileDTO.setProduct_num(productDTO.getProduct_num());
				fileDTO.setFileName(fileName);
				fileDTO.setOriName(f.getOriginalFilename());
				result = storeFileDAO.setInsert(fileDTO);
			}
		}
		
		return result;
	}
	
	public int setDelete(ProductDTO productDTO) {
		return productDAO.setDelete(productDTO);
	}
	
	public int setUpdate(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = productDAO.setUpdate(productDTO);
		result = storeFileDAO.setDelete(productDTO);
		String path = session.getServletContext().getRealPath("/resources/img/upload/product");
		System.out.println(path);
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		for(MultipartFile f : files) {
			if(f.getSize() != 0) {
				String fileName = fileSaver.save(file, f);
				StoreFileDTO fileDTO = new StoreFileDTO();
				fileDTO.setProduct_num(productDTO.getProduct_num());
				fileDTO.setFileName(fileName);
				fileDTO.setOriName(f.getOriginalFilename());
				result = storeFileDAO.setInsert(fileDTO);
			}
		}
		
		return result;
	}
	
	
	public List<ProductDTO> getList_admin(ProductPager productPager)throws Exception{
		productPager.makeRow();
		productPager.setTotalCount(productDAO.getCount(productPager));
		productPager.makePage();
		return productDAO.getList_admin(productPager);
	}
	
	public int setUpdate_admin(ProductDTO productDTO) throws Exception{
		return productDAO.setUpdate_admin(productDTO);
	}
	
}
